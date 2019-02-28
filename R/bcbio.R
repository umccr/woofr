
#' Get bcbio final output files
#'
#' Generates a tibble containing absolute path to bcbio final files.
#'
#' @param final Path to `final` bcbio directory.
#' @return A tibble with the following columns:
#'   - fpath: path to file
#'   - ftype: file type. Can be one of:
#'     1. ensembl-batch
#      2. mutect2-batch
#      3. strelka2-batch
#      4. vardict-batch
#      5. ensemble-germ
#      6. gatk-germ
#      7. strelka2-germ
#      8. vardict-germ
#'
#' @examples
#' \dontrun{
#' final <- "path/to/bcbio/final"
#' bcbio_outputs(final)
#' }
#' @export
bcbio_outputs <- function(final) {
  vcfs <- list.files(final, pattern = "\\.vcf.gz$", recursive = TRUE, full.names = TRUE)

  tibble::tibble(fpath = vcfs) %>%
    dplyr::mutate(bname = basename(.data$fpath)) %>%
    dplyr::select(.data$bname, .data$fpath) %>%
    dplyr::mutate(ftype = dplyr::case_when(
      grepl("germline-ensemble", .data$bname) ~ "ensemble-germ",
      grepl("ensemble", .data$bname) ~ "ensemble-batch",
      grepl("germline-vardict", .data$bname) ~ "vardict-germ",
      grepl("vardict-germline", .data$bname) ~ "OTHER",
      grepl("vardict", .data$bname) ~ "vardict-batch",
      grepl("germline-strelka2", .data$bname) ~ "strelka-germ",
      grepl("strelka2", .data$bname) ~ "strelka-batch",
      grepl("mutect2", .data$bname) ~ "mutect-batch",
      grepl("germline-gatk-haplotype", .data$bname) ~ "gatk-germ",
      grepl("manta", .data$bname) ~ "Manta",
      TRUE ~ "OTHER")) %>%
    dplyr::select(.data$ftype, .data$fpath)
}