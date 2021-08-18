flattenPackage <- function(project, tmpdir) {
  projectHome <- normalizePath(project)
  projectName <- basename(projectHome)

  # pkg.tmpdir <- tempdir(check = TRUE)
  pkg.tmpdir <- tmpdir
  pkg.tmpdirProject <- file.path(pkg.tmpdir, projectName)
  pkg.tmpdirProjectR <- file.path(pkg.tmpdir, projectName, "R")
  pkg.tmpdirProjectRtmp <- file.path(pkg.tmpdir, projectName, "Rtmp")

  if (dir.exists(pkg.tmpdirProject)) {
    # unlink(pkg.tmpdirProject, recursive = TRUE)
    filesList <- list.files(pkg.tmpdirProject, full.names = TRUE)
    unlink(filesList, recursive = TRUE)
  }
  file.copy(projectHome, pkg.tmpdir, overwrite = TRUE, recursive = TRUE)

  file.rename(pkg.tmpdirProjectR, pkg.tmpdirProjectRtmp)
  dir.create(pkg.tmpdirProjectR, recursive = TRUE)

  RtmpFiles <- list.files(pkg.tmpdirProjectRtmp, pattern = "\\.[Rr]$", recursive = TRUE)
  RFilesNameNew <- gsub(x = RtmpFiles, pattern = .Platform$file.sep, replacement = "__")

  for (i in 1:length(RtmpFiles)) {
    from <- file.path(pkg.tmpdirProjectRtmp, RtmpFiles[i])
    to <- file.path(pkg.tmpdirProjectR, RFilesNameNew[i])
    file.rename(from, to)
  }
  unlink(pkg.tmpdirProjectRtmp, recursive = TRUE)
  # unlink(file.path(pkg.tmpdirProject, ".git"), recursive = TRUE)

  file_find_replace <- function(filepath, pattern, replacement, patternCriteria = "") {
    file_contents <- readLines(filepath, warn = FALSE)
    updated_contents <- sapply(file_contents, function(line) {
      matches <- grep(patternCriteria, line)
      if (length(matches) > 0) {
        return(gsub(x = line, pattern = pattern, replacement = replacement, perl = TRUE))
      }
      return(line)
    })
    cat(updated_contents, file = filepath, sep = "\n")
  }

  my_r_scripts <- list.files(path = pkg.tmpdirProjectR, pattern = "(r|R)$")

  for (r_script in my_r_scripts) {
    file_find_replace(
      paste0(pkg.tmpdirProjectR, "/", r_script),
      pattern = "(?<!\\/R)(\\/)(?!R\\/)",
      replacement = "__",
      patternCriteria = "(source\\([\"|\'].\\/R\\/)"
    )
  }

  pkg.HS <- file.path(pkg.tmpdir, projectName, sep = "")
  message("Project `", projectName, "` is flattened into \n\t", pkg.HS)

  return(invisible(pkg.HS))
}
