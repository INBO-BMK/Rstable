FROM inbobmk/rlatex:3.2.3

## This handle reaches Thierry
MAINTAINER "Thierry Onkelinx" thierry.onkelinx@inbo.be

COPY cran-install.sh cran-install.sh

## Install devtools and dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    git \
    libssl-dev \
    libssh2-1-dev \
  && apt-get clean \
  && ./cran-install.sh jsonlite 0.9.19  \
  && ./cran-install.sh mime 0.4  \
  && ./cran-install.sh curl 0.9.7  \
  && ./cran-install.sh digest 0.6.9  \
  && ./cran-install.sh R6 2.1.2  \
  && ./cran-install.sh magrittr 1.5  \
  && ./cran-install.sh stringi 1.0-1  \
  && ./cran-install.sh stringr 1.0.0  \
  && ./cran-install.sh openssl 0.9.3  \
  && ./cran-install.sh httr 1.1.0  \
  && ./cran-install.sh git2r 0.14.0   \
  && ./cran-install.sh memoise 1.0.0  \
  && ./cran-install.sh whisker 0.3-2  \
  && ./cran-install.sh rstudioapi 0.5  \
  && ./cran-install.sh withr 1.0.1  \
  && ./cran-install.sh devtools 1.11.1

## Install digest 0.6.9.3 from Github
RUN Rscript -e 'devtools::install_github("eddelbuettel/digest", ref = "fcbb3315450b9c1bf7121efd69bec605ce57fb51", upgrade_dependencies = FALSE)'

## Install assertthat
RUN  ./cran-install.sh assertthat 0.1

## Install dplyr and dependencies
RUN  ./cran-install.sh Rcpp 0.12.4  \
  && ./cran-install.sh lazyeval 0.1.10  \
  && ./cran-install.sh DBI 0.4-1  \
  && ./cran-install.sh BH 1.60.0-2  \
  && ./cran-install.sh dplyr 0.4.3

## Install plyr
RUN  ./cran-install.sh plyr 1.8.3

## Install lubridate
RUN  ./cran-install.sh lubridate 1.5.6

## Install RODBC and dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    pkg-config \
    libltdl7 \
    libodbc1 \
    unixodbc-dev \
  && apt-get clean \
  && ./cran-install.sh RODBC 1.3-13

## Install testthat and dependencies
RUN  ./cran-install.sh crayon 1.3.1  \
  && ./cran-install.sh praise 1.0.0  \
  && ./cran-install.sh testthat 1.0.2

## Install rmarkdown and dependencies
RUN  ./cran-install.sh yaml 2.1.13  \
  && ./cran-install.sh evaluate 0.9  \
  && ./cran-install.sh formatR 1.3  \
  && ./cran-install.sh highr 0.5.1  \
  && ./cran-install.sh markdown 0.7.7  \
  && ./cran-install.sh knitr 1.12.3  \
  && ./cran-install.sh bitops 1.0-6  \
  && ./cran-install.sh caTools 1.17.1  \
  && ./cran-install.sh htmltools 0.3.5  \
  && ./cran-install.sh rmarkdown 0.9.6

## Install covr and dependencies
RUN  ./cran-install.sh rex 1.1.1  \
  && ./cran-install.sh covr 2.0.1

## Install ggplot2 and dependencies
RUN  ./cran-install.sh colorspace 1.2-6  \
  && ./cran-install.sh munsell 0.4.3  \
  && ./cran-install.sh RColorBrewer 1.1-2  \
  && ./cran-install.sh dichromat 2.0-0  \
  && ./cran-install.sh labeling 0.3  \
  && ./cran-install.sh scales 0.4.0  \
  && ./cran-install.sh reshape2 1.4.1  \
  && ./cran-install.sh gtable 0.2.0  \
  && ./cran-install.sh ggplot2 2.1.0

## Install xtable
RUN  ./cran-install.sh xtable 1.8-2

## Install igraph and its dependencies
RUN  ./cran-install.sh registry 0.3  \
  && ./cran-install.sh pkgmaker 0.22  \
  && ./cran-install.sh rngtools 1.2.4  \
  && ./cran-install.sh gridBase 0.4-7  \
  && ./cran-install.sh iterators 1.0.8  \
  && ./cran-install.sh foreach 1.4.3  \
  && ./cran-install.sh doParallel 1.0.10  \
  && ./cran-install.sh NMF 0.20.6  \
  && ./cran-install.sh irlba 2.0.0  \
  && ./cran-install.sh igraph 1.0.1

## install lintr and dependencies
RUN  ./cran-install.sh stringdist 0.9.4.1  \
  && ./cran-install.sh lintr 1.0.0

## install sp
RUN  ./cran-install.sh sp 1.2-3

## install tidyr
RUN  ./cran-install.sh tidyr 0.4.1

## install lme4
RUN  ./cran-install.sh minga 1.2.4  \
  && ./cran-install.sh nloptr 1.0.4  \
  && ./cran-install.sh RcppEigen 0.3.2.8.1  \
  && ./cran-install.sh lme4 1.1-12

## install optimx and dependencies
RUN  ./cran-install.sh numDeriv 2014.2-1  \
  && ./cran-install.sh optextras 2013-10.28  \
  && ./cran-install.sh Rvmmin 2013-11.12  \
  && ./cran-install.sh Rcgmin 2013-2.21  \
  && ./cran-install.sh quadprog 1.5-5  \
  && ./cran-install.sh BB 2014.10-1  \
  && ./cran-install.sh ucminf 1.1-3  \
  && ./cran-install.sh setRNG 2013.9-1  \
  && ./cran-install.sh dfoptim 2011.8-1  \
  && ./cran-install.sh svUnit 0.7-12  \
  && ./cran-install.sh optimx 2013.8.7

## install INLA
RUN wget https://github.com/inbo/INLA/archive/v0.0-1455098891.tar.gz \
  && R CMD INSTALL v0.0-1455098891.tar.gz \
  && rm v0.0-1455098891.tar.gz

## install roxygen2 and dependencies
RUN  ./cran-install.sh brew 1.0-6  \
  && ./cran-install.sh roxygen2 5.0.1

## install RSQLite
RUN  ./cran-install.sh RSQLite 1.0.0

## install rmvtnorm
RUN  ./cran-install.sh mvtnorm 1.0-5

## install snowfall
RUN  ./cran-install.sh snow 0.4-2  \
  && ./cran-install.sh snowfall 1.84-6.1

## Start R
CMD ["R", "--no-save", "--no-restore"]
