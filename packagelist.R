tmp <- installed.packages()[, c("Version", "Priority")]
rec <- subset(tmp, tmp[, "Priority"] == "recommended")
rec <- rec[order(rownames(rec)), ]
other <- subset(tmp, is.na(tmp[, "Priority"]))
other <- other[order(rownames(other)), ]
tmp2 <- rbind(
  Ubuntu = gsub("Ubuntu ", "", sessionInfo()$running),
  TexLive = gsub(
    ".*:\\s*",
    "",
    system("apt-cache policy texlive-xetex", intern = TRUE)[3]
  ),
  qpdf = gsub(".*version ", "", system("qpdf --version", intern = TRUE)[1]),
  Pandoc = as.character(rmarkdown::pandoc_version()),
  R = c(paste(version$major, version$minor, sep = ".")),
  rec,
  other
)
tmp2 <- head(tmp2)
cat(
  "\n\n",
  sprintf("\n| %18s | %15s |", rownames(tmp2), tmp2[, "Version"]),
  "\n\n"
)

