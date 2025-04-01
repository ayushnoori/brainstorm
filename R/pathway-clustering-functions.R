#' Compute Jaccard similarity matrix for gene sets.
#'
#' Given a list of gene member vectors, this function computes the pairwise Jaccard similarity matrix.
#'
#' @param members_list A named list where each element is a character vector representing gene members.
#' @return A numeric matrix with row and column names corresponding to the names in \code{members_list}.
#' @export
compute_jaccard_similarity <- function(members_list) {
  # Internal helper: compute Jaccard similarity between two vectors.
  jaccard <- function(a, b) {
    intersect_length <- length(intersect(a, b))
    union_length <- length(union(a, b))
    if (union_length == 0) return(0)
    return(intersect_length / union_length)
  }

  n <- length(members_list)
  sim_matrix <- matrix(NA, nrow = n, ncol = n)
  for (i in seq_len(n)) {
    for (j in seq_len(n)) {
      sim_matrix[i, j] <- jaccard(members_list[[i]], members_list[[j]])
    }
  }
  rownames(sim_matrix) <- names(members_list)
  colnames(sim_matrix) <- names(members_list)
  return(sim_matrix)
}

#' Annotate pathway clusters for manual review.
#'
#' This function inserts header rows into a pathways data table for manual annotation
#' and computes average values for each cluster.
#'
#' @param dt A \code{data.table} containing pathways data with a column named \code{Cluster}.
#' @return A \code{data.frame} with inserted header rows and computed averages for each cluster.
#' @export
annotate_clusters <- function(dt) {
  dt_annot <- copy(dt)
  setDF(dt_annot)

  # Identify the first row of each cluster.
  header_idx <- which(!duplicated(dt_annot$Cluster))
  # Insert an empty row before each cluster header.
  for (i in seq_along(header_idx)) {
    dt_annot <- dplyr::add_row(dt_annot, .before = header_idx[i])
    header_idx <- header_idx + 1  # adjust indices after insertion
  }

  # Identify header rows (now rows with NA in Cluster indicate annotation rows).
  header_idx <- which(is.na(dt_annot$Cluster))

  # Compute cluster averages and set annotation row values.
  for (i in seq_along(header_idx)) {
    if (i == length(header_idx)) {
      clus <- dt_annot[(header_idx[i] + 1):nrow(dt_annot), ]
    } else {
      clus <- dt_annot[(header_idx[i] + 1):(header_idx[i + 1] - 1), ]
    }
    clus_id <- dt_annot[header_idx[i] + 1, "Cluster"]
    dt_annot[header_idx[i], "Cluster"] <- paste0("Cluster #", clus_id)
    dt_annot[header_idx[i], "SIZE"] <- mean(as.numeric(clus[, "SIZE"]), na.rm = TRUE)
    dt_annot[header_idx[i], "ES"] <- mean(as.numeric(clus[, "ES"]), na.rm = TRUE)
    dt_annot[header_idx[i], "NES"] <- mean(as.numeric(clus[, "NES"]), na.rm = TRUE)
  }

  return(dt_annot)
}

#' Add annotated pathways table to Excel workbook.
#'
#' This function adds an annotated pathways table to an Excel workbook with appropriate formatting and styles.
#'
#' @param annot_table A data.frame or data.table with the annotated pathways data.
#' @param wb A workbook object created by \code{openxlsx::createWorkbook()}.
#' @param sheet_name A character string specifying the worksheet name.
#' @param tab_color A character string representing the hex color code for the worksheet tab.
#' @return This function does not return a value; it modifies the workbook object in place.
#' @export
add_table_to_workbook <- function(annot_table, wb, sheet_name, tab_color) {
  hs <- createStyle(fontColour = "#FAF3DD", fgFill = "#5171A5", fontName = "Arial Black",
                    halign = "left", valign = "center", textDecoration = "Bold",
                    border = "Bottom", borderStyle = "thick", fontSize = 14)

  addWorksheet(wb, sheetName = sheet_name, tabColour = tab_color)
  writeDataTable(wb, sheet_name, x = annot_table, tableStyle = "TableStyleMedium15",
                 headerStyle = hs, bandedRows = FALSE)
  setColWidths(wb, sheet_name, cols = 1:17, widths = "auto")
  setColWidths(wb, sheet_name, cols = 5, widths = 60)
  freezePane(wb, sheet_name, firstRow = TRUE, firstCol = FALSE)

  # Apply alternating row styles.
  even_idx <- as.integer(annot_table$Cluster) %% 2 == 0
  even_idx[is.na(even_idx)] <- FALSE
  addStyle(wb, sheet_name, createStyle(fontColour = "#363635", fgFill = "#FAF3DD",
                                       fontName = "Arial", fontSize = 10),
           rows = which(even_idx) + 1, cols = 1:17, gridExpand = TRUE)
  addStyle(wb, sheet_name, createStyle(fontColour = "#363635", fgFill = "#C4E4E9",
                                       fontName = "Arial", fontSize = 10),
           rows = which(!even_idx) + 1, cols = 1:17, gridExpand = TRUE)

  # Style header annotation rows (rows with NA in Name).
  addStyle(wb, sheet_name, createStyle(fontColour = "#363635", fgFill = "#FFA69E", fontName = "Arial",
                                       textDecoration = "Bold", border = "TopBottom", borderStyle = "thick"),
           rows = which(is.na(annot_table$Name)) + 1, cols = 1:17, gridExpand = TRUE)
}

#' Perform Jaccard clustering of pathways and output results to an Excel workbook.
#'
#' This function performs hierarchical clustering on gene sets (pathways) based on the Jaccard similarity of their gene members.
#' It subsets pathways from the supplied \code{pathway_table} using the specified contrast, computes the similarity matrix,
#' performs hierarchical clustering, and generates a dendrogram saved as a PDF. The function then annotates the pathways with cluster information
#' (using \code{annotate_clusters()}) and writes the result to a specified worksheet in an \code{openxlsx} workbook via \code{add_table_to_workbook()}.
#'
#' @param contrast A character string specifying the contrast (e.g., \code{"WT vs. GFP"}) used to subset the pathways.
#' @param contrast_color A character string representing the tab color (as a hex code, e.g., \code{"#FAE1DD"}) for the worksheet corresponding to this contrast.
#' @param wb A workbook object created by \code{openxlsx::createWorkbook()} where the clustered results will be added.
#' @param pathway_table A \code{data.table} containing the pathways to be clustered. This table must include the following columns:
#' \code{Contrast}, \code{MEMBERS_SYMBOLIZED}, \code{NAME}, \code{Comparison}, \code{Regulation}, \code{SIZE}, \code{ES}, \code{NES},
#' \code{NOM.p.val}, \code{FDR.q.val}, \code{FWER.p.val}, \code{CONTRIBUTOR}, \code{SUB_CATEGORY_CODE}, \code{EXACT_SOURCE},
#' \code{DESCRIPTION_BRIEF}, and \code{MEMBERS_EZID}.
#' @return A \code{data.table} containing the pathways annotated with cluster information.
#' @details The dendrogram is saved as a PDF in the \code{"Results/GSEA_preranked/pathways"} directory relative to the project root.
#' @seealso \code{\link{compute_jaccard_similarity}}, \code{\link{annotate_clusters}}, \code{\link{add_table_to_workbook}}
#' @export
cluster_jaccard <- function(contrast, contrast_color, wb, pathway_table) {

  ## Input Validation ----------------------------------------------------------
  required_cols <- c("Contrast", "MEMBERS_SYMBOLIZED", "NAME", "Comparison", "Regulation",
                     "SIZE", "ES", "NES", "NOM.p.val", "FDR.q.val", "FWER.p.val",
                     "CONTRIBUTOR", "SUB_CATEGORY_CODE", "EXACT_SOURCE", "DESCRIPTION_BRIEF", "MEMBERS_EZID")
  missing_cols <- setdiff(required_cols, names(pathway_table))
  if (length(missing_cols) > 0) {
    stop("The pathway_table is missing required columns: ", paste(missing_cols, collapse = ", "))
  }

  ## Directory Setup -----------------------------------------------------------
  clust_path <- here("Results", "GSEA_preranked", "pathways")
  if (!dir.exists(clust_path)) {
    dir.create(clust_path, recursive = TRUE)
  }

  ## Subset and Prepare Data ---------------------------------------------------
  pathways_dt <- pathway_table[Contrast == contrast]
  if (nrow(pathways_dt) == 0) {
    stop("No pathways found for the contrast: ", contrast)
  }

  # Prepare members list (trim whitespace from gene names).
  members_list <- lapply(pathways_dt[, MEMBERS_SYMBOLIZED], function(x) {
    trimws(unlist(strsplit(x, ",")))
  })
  names(members_list) <- pathways_dt[, NAME]

  ## Clustering ----------------------------------------------------------------
  sim_matrix <- compute_jaccard_similarity(members_list)
  diss <- as.dist(1 - sim_matrix)
  pathway_clust <- hclust(diss)

  # Cut the dendrogram at a predefined threshold.
  thresh <- 0.9999999
  pathway_cut <- cutree(pathway_clust, h = thresh)
  message(contrast, " Clusters: ", max(pathway_cut))

  ## Save Dendrogram -----------------------------------------------------------
  dend_file <- here(clust_path, paste(contrast, "Dendrogram.pdf", sep = " "))
  pdf(dend_file, width = 10, height = 6, pointsize = 6)
  par(mar = c(5, 5, 0, 20))
  plot(as.dendrogram(pathway_clust), xlab = "Height", ylab = "Pathway",
       horiz = TRUE, cex.lab = 1.5, cex.axis = 2)
  abline(v = thresh, col = "red", lty = 2)
  dev.off()

  ## Annotate Data -------------------------------------------------------------
  pathways_dt[, Cluster := pathway_cut]
  setcolorder(pathways_dt, "Cluster")

  pathways_dt <- pathways_dt[order(Cluster), ] %>%
    .[, .(Cluster, Contrast, Comparison, Regulation, NAME, SIZE, ES, NES,
          NOM.p.val, FDR.q.val, FWER.p.val, CONTRIBUTOR, SUB_CATEGORY_CODE,
          EXACT_SOURCE, DESCRIPTION_BRIEF, MEMBERS_SYMBOLIZED, MEMBERS_EZID)]

  # Rename columns to user-friendly names.
  setnames(pathways_dt,
           old = c("NAME", "SIZE", "NOM.p.val", "FDR.q.val", "FWER.p.val",
                   "CONTRIBUTOR", "SUB_CATEGORY_CODE", "EXACT_SOURCE",
                   "DESCRIPTION_BRIEF", "MEMBERS_SYMBOLIZED", "MEMBERS_EZID"),
           new = c("Name", "Size", "Nominal p-Val", "FDR q-Val", "FWER p-Val",
                   "Ontology", "Database", "ID", "Description", "Genes", "Entrez"))

  ## Create Annotated Table and Add to Workbook -------------------------------
  annot_table <- annotate_clusters(copy(pathways_dt))
  add_table_to_workbook(annot_table, wb, sheet_name = contrast, tab_color = contrast_color)

  return(pathways_dt)
}
