FROM inbobmk/rlatex:3.3.2

## This handle reaches Thierry
MAINTAINER "Thierry Onkelinx" thierry.onkelinx@inbo.be

## script to install specific R package from CRAN
COPY cran_install.sh cran_install.sh

## Install devtools and dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    git \
    libssl-dev \
    libssh2-1-dev \
  && apt-get clean

RUN  ./cran_install.sh jsonlite 1.1 \
  && ./cran_install.sh mime 0.5 \
  && ./cran_install.sh curl 2.2 \
  && ./cran_install.sh digest 0.6.12 \
  && ./cran_install.sh R6 2.2.0 \
  && ./cran_install.sh magrittr 1.5 \
  && ./cran_install.sh stringi 1.1.2 \
  && ./cran_install.sh stringr 1.1.0 \
  && ./cran_install.sh openssl 0.9.5 \
  && ./cran_install.sh httr 1.2.1 \
  && ./cran_install.sh git2r 0.15.0  \
  && ./cran_install.sh memoise 1.0.0 \
  && ./cran_install.sh whisker 0.3-2 \
  && ./cran_install.sh rstudioapi 0.6 \
  && ./cran_install.sh withr 1.0.2 \
  && ./cran_install.sh devtools 1.12.0

## Install assertthat
RUN  ./cran_install.sh assertthat 0.1

## Install dplyr and dependencies
RUN  ./cran_install.sh Rcpp 0.12.7 \
  && ./cran_install.sh lazyeval 0.2.0 \
  && ./cran_install.sh DBI 0.5-1 \
  && ./cran_install.sh BH 1.60.0-2 \
  && ./cran_install.sh tibble 1.2 \
  && ./cran_install.sh dplyr 0.5.0

## Install plyr
RUN  ./cran_install.sh plyr 1.8.4

## Install lubridate
RUN  ./cran_install.sh lubridate 1.6.0

## Install freetds
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    freetds-dev \
    freetds-bin \
    tdsodbc \
  && apt-get clean

## Install RODBC and dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    pkg-config \
    libltdl7 \
    libodbc1 \
    unixodbc-dev \
  && apt-get clean
RUN  ./cran_install.sh RODBC 1.3-14

## Install testthat and dependencies
RUN  ./cran_install.sh crayon 1.3.2 \
  && ./cran_install.sh praise 1.0.0 \
  && ./cran_install.sh testthat 1.0.2

## Install rmarkdown and dependencies
RUN  ./cran_install.sh yaml 2.1.14 \
  && ./cran_install.sh evaluate 0.10 \
  && ./cran_install.sh formatR 1.4 \
  && ./cran_install.sh highr 0.6 \
  && ./cran_install.sh markdown 0.7.7 \
  && ./cran_install.sh knitr 1.15 \
  && ./cran_install.sh bitops 1.0-6 \
  && ./cran_install.sh caTools 1.17.1 \
  && ./cran_install.sh htmltools 0.3.5 \
  && ./cran_install.sh base64enc 0.1-3 \
  && ./cran_install.sh rmarkdown 1.1

## Install covr and dependencies
RUN  ./cran_install.sh rex 1.1.1 \
  && ./cran_install.sh covr 2.2.1

## Install ggplot2 and dependencies
RUN  ./cran_install.sh colorspace 1.3-0 \
  && ./cran_install.sh munsell 0.4.3 \
  && ./cran_install.sh RColorBrewer 1.1-2 \
  && ./cran_install.sh dichromat 2.0-0 \
  && ./cran_install.sh labeling 0.3 \
  && ./cran_install.sh scales 0.4.1 \
  && ./cran_install.sh reshape2 1.4.2 \
  && ./cran_install.sh gtable 0.2.0 \
  && ./cran_install.sh ggplot2 2.2.0

## Install xtable
RUN  ./cran_install.sh xtable 1.8-2

## Install igraph and its dependencies
RUN  ./cran_install.sh registry 0.3 \
  && ./cran_install.sh pkgmaker 0.22 \
  && ./cran_install.sh rngtools 1.2.4 \
  && ./cran_install.sh gridBase 0.4-7 \
  && ./cran_install.sh iterators 1.0.8 \
  && ./cran_install.sh foreach 1.4.3 \
  && ./cran_install.sh doParallel 1.0.10 \
  && ./cran_install.sh NMF 0.20.6 \
  && ./cran_install.sh irlba 2.1.2 \
  && ./cran_install.sh igraph 1.0.1

## install lintr and dependencies
RUN  ./cran_install.sh stringdist 0.9.4.2 \
  && ./cran_install.sh lintr 1.0.0

## install sp
RUN  ./cran_install.sh sp 1.2-3

## install tidyr
RUN  ./cran_install.sh tidyr 0.6.0

## install lme4
RUN  ./cran_install.sh minqa 1.2.4 \
  && ./cran_install.sh nloptr 1.0.4 \
  && ./cran_install.sh RcppEigen 0.3.2.9.0 \
  && ./cran_install.sh lme4 1.1-12

## install optimx and dependencies
RUN  ./cran_install.sh numDeriv 2016.8-1 \
  && ./cran_install.sh optextras 2016-8.8 \
  && ./cran_install.sh Rvmmin 2013-11.12 \
  && ./cran_install.sh Rcgmin 2013-2.21 \
  && ./cran_install.sh quadprog 1.5-5 \
  && ./cran_install.sh BB 2014.10-1 \
  && ./cran_install.sh ucminf 1.1-4 \
  && ./cran_install.sh setRNG 2013.9-1 \
  && ./cran_install.sh dfoptim 2016.7-1 \
  && ./cran_install.sh svUnit 0.7-12 \
  && ./cran_install.sh optimx 2013.8.7

## install INLA
RUN wget https://github.com/inbo/INLA/archive/v0.0-1468872408.tar.gz \
  && R CMD INSTALL v0.0-1468872408.tar.gz \
  && rm v0.0-1468872408.tar.gz

## install roxygen2 and dependencies
RUN  ./cran_install.sh brew 1.0-6 \
  && ./cran_install.sh roxygen2 5.0.1

## install RSQLite
RUN  ./cran_install.sh RSQLite 1.0.0

## install rmvtnorm
RUN  ./cran_install.sh mvtnorm 1.0-5

## install snowfall
RUN  ./cran_install.sh snow 0.4-2 \
  && ./cran_install.sh snowfall 1.84-6.1

## install rgeos
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     libgeos++-dev \
  && ./cran_install.sh rgeos 0.3-21

## install multimput
RUN wget https://github.com/inbo/multimput/archive/v0.2.5.tar.gz \
  && R CMD INSTALL v0.2.5.tar.gz \
  && rm v0.2.5.tar.gz

## install aws.s3
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libxml2-dev \
  && ./cran_install.sh xml2 1.1.0 \
  && ./cran_install.sh aws.signature 0.2.6 \
  && Rscript -e "devtools::install_github('cloudyr/aws.s3', ref = '72edc122c763bf9e8db546a8c8c22794659b110d', dependencies = FALSE, upgrade_dependencies = FALSE)"

## install RPostgreSQL
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libpq-dev \
  && ./cran_install.sh RPostgreSQL 0.4-1

## Start R
CMD ["R", "--no-save", "--no-restore"]
