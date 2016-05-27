FROM ubuntu:14.04.3

## This handle reaches Thierry
MAINTAINER "Thierry Onkelinx" thierry.onkelinx@inbo.be

## Set a default user. Available via runtime flag `--user docker`
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (for rstudio or linked volumes to work properly).
RUN useradd docker \
  && mkdir /home/docker \
  && chown docker:docker /home/docker \
  && addgroup docker staff

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen en_US.utf8 \
  && /usr/sbin/update-locale LANG=en_US.UTF-8

## Add apt-get repositories
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' \
  && gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 \
  && gpg -a --export E084DAB9 | apt-key add -

## Install R base
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    r-base-core=3.2.3-6trusty0 \
    r-base-dev=3.2.3-6trusty0 \
    r-cran-boot=1.3-17-1trusty0 \
    r-cran-class=7.3-14-1trusty0 \
    r-cran-cluster=2.0.3-1trusty0 \
    r-cran-codetools=0.2-14-1~ubuntu14.04.1~ppa1 \
    r-cran-foreign=0.8.66-1trusty0 \
    r-cran-kernsmooth=2.23-15-1trusty0 \
    r-cran-lattice=0.20-33-1trusty0 \
    r-cran-matrix=1.2-4-1trusty0 \
    r-cran-mgcv=1.8-12-1cran1trusty0 \
    r-cran-nlme=3.1.125-1trusty0 \
    r-cran-nnet=7.3-12-1trusty0 \
    r-cran-mass=7.3-44-1trusty0 \
    r-cran-rpart=4.1-10-1trusty0 \
    r-cran-spatial=7.3-10-1trusty0 \
    r-cran-survival=2.39-2-1cran1trusty0 \
    r-recommended=3.2.3-6trusty0 \
  && apt-get clean

## Install wget
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    wget \
  && apt-get clean

## Install devtools and dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    git \
    libssl-dev \
    libssh2-1-dev \
  && apt-get clean \
  && wget https://cran.rstudio.com/src/contrib/Archive/jsonlite/jsonlite_0.9.19.tar.gz \
  && R CMD INSTALL jsonlite_0.9.19.tar.gz \
  && rm jsonlite_0.9.19.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/mime_0.4.tar.gz \
  && R CMD INSTALL mime_0.4.tar.gz \
  && rm mime_0.4.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/curl_0.9.7.tar.gz \
  && R CMD INSTALL curl_0.9.7.tar.gz \
  && rm curl_0.9.7.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/digest_0.6.9.tar.gz \
  && R CMD INSTALL digest_0.6.9.tar.gz \
  && rm digest_0.6.9.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/R6_2.1.2.tar.gz \
  && R CMD INSTALL R6_2.1.2.tar.gz \
  && rm R6_2.1.2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/magrittr_1.5.tar.gz \
  && R CMD INSTALL magrittr_1.5.tar.gz \
  && rm magrittr_1.5.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/stringi_1.0-1.tar.gz \
  && R CMD INSTALL stringi_1.0-1.tar.gz \
  && rm stringi_1.0-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/stringr_1.0.0.tar.gz \
  && R CMD INSTALL stringr_1.0.0.tar.gz \
  && rm stringr_1.0.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/openssl/openssl_0.9.3.tar.gz \
  && R CMD INSTALL openssl_0.9.3.tar.gz \
  && rm openssl_0.9.3.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/httr_1.1.0.tar.gz \
  && R CMD INSTALL httr_1.1.0.tar.gz \
  && rm httr_1.1.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/git2r/git2r_0.14.0.tar.gz \
  && R CMD INSTALL git2r_0.14.0.tar.gz  \
  && rm git2r_0.14.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/memoise_1.0.0.tar.gz \
  && R CMD INSTALL memoise_1.0.0.tar.gz \
  && rm memoise_1.0.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/whisker_0.3-2.tar.gz \
  && R CMD INSTALL whisker_0.3-2.tar.gz \
  && rm whisker_0.3-2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/rstudioapi_0.5.tar.gz \
  && R CMD INSTALL rstudioapi_0.5.tar.gz \
  && rm rstudioapi_0.5.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/withr_1.0.1.tar.gz \
  && R CMD INSTALL withr_1.0.1.tar.gz \
  && rm withr_1.0.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/devtools_1.11.1.tar.gz \
  && R CMD INSTALL devtools_1.11.1.tar.gz \
  && rm devtools_1.11.1.tar.gz

## Install digest 0.6.9.3 from Github
RUN Rscript -e 'devtools::install_github("eddelbuettel/digest", ref = "fcbb3315450b9c1bf7121efd69bec605ce57fb51", upgrade_dependencies = FALSE)'

## Install assertthat
RUN wget https://cran.rstudio.com/src/contrib/assertthat_0.1.tar.gz \
  && R CMD INSTALL assertthat_0.1.tar.gz \
  && rm assertthat_0.1.tar.gz

## Install dplyr and dependencies
RUN wget https://cran.rstudio.com/src/contrib/Archive/Rcpp/Rcpp_0.12.4.tar.gz \
  && R CMD INSTALL Rcpp_0.12.4.tar.gz \
  && rm Rcpp_0.12.4.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/lazyeval_0.1.10.tar.gz\
  && R CMD INSTALL lazyeval_0.1.10.tar.gz \
  && rm lazyeval_0.1.10.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/DBI_0.4-1.tar.gz \
  && R CMD INSTALL DBI_0.4-1.tar.gz \
  && rm DBI_0.4-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/BH_1.60.0-2.tar.gz \
  && R CMD INSTALL BH_1.60.0-2.tar.gz \
  && rm BH_1.60.0-2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/dplyr_0.4.3.tar.gz \
  && R CMD INSTALL dplyr_0.4.3.tar.gz \
  && rm dplyr_0.4.3.tar.gz

## Install plyr
RUN wget https://cran.rstudio.com/src/contrib/plyr_1.8.3.tar.gz \
  && R CMD INSTALL plyr_1.8.3.tar.gz \
  && rm plyr_1.8.3.tar.gz

## Install lubridate
RUN wget https://cran.rstudio.com/src/contrib/lubridate_1.5.6.tar.gz \
  && R CMD INSTALL lubridate_1.5.6.tar.gz \
  && rm lubridate_1.5.6.tar.gz

## Install RODBC and dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    pkg-config \
    libltdl7 \
    libodbc1 \
    unixodbc-dev \
  && apt-get clean \
  && wget https://cran.rstudio.com/src/contrib/RODBC_1.3-13.tar.gz \
  && R CMD INSTALL RODBC_1.3-13.tar.gz \
  && rm RODBC_1.3-13.tar.gz

## Install testthat and dependencies
RUN wget https://cran.rstudio.com/src/contrib/crayon_1.3.1.tar.gz \
  && R CMD INSTALL crayon_1.3.1.tar.gz \
  && rm crayon_1.3.1.tar.gz \
  && wget https://github.com/cran/praise/archive/1.0.0.tar.gz \
  && R CMD INSTALL 1.0.0.tar.gz \
  && rm 1.0.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/testthat_1.0.2.tar.gz \
  && R CMD INSTALL testthat_1.0.2.tar.gz \
  && rm testthat_1.0.2.tar.gz

## Add minimal LaTeX configuration
## Taken from https://github.com/rocker-org/hadleyverse/blob/master/Dockerfile
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    lmodern \
    qpdf \
    texlive-fonts-recommended \
    texlive-humanities \
    texlive-latex-extra \
    texinfo \
  && apt-get clean \
  && cd /usr/share/texlive/texmf-dist \
  && wget http://mirrors.ctan.org/install/fonts/inconsolata.tds.zip \
  && unzip inconsolata.tds.zip \
  && rm inconsolata.tds.zip \
  && echo "Map zi4.map" >> /usr/share/texlive/texmf-dist/web2c/updmap.cfg \
  && mktexlsr \
  && updmap-sys

## Install pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/1.17.0.2/pandoc-1.17.0.2-1-amd64.deb \
  && dpkg -i pandoc-1.17.0.2-1-amd64.deb \
  && rm pandoc-1.17.0.2-1-amd64.deb

## Install rmarkdown and dependencies
RUN wget https://github.com/cran/yaml/archive/2.1.13.tar.gz \
  && R CMD INSTALL 2.1.13.tar.gz \
  && rm 2.1.13.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/evaluate_0.9.tar.gz \
  && R CMD INSTALL evaluate_0.9.tar.gz \
  && rm evaluate_0.9.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/formatR/formatR_1.3.tar.gz \
  && R CMD INSTALL formatR_1.3.tar.gz \
  && rm formatR_1.3.tar.gz \
  && wget https://github.com/cran/highr/archive/0.5.1.tar.gz \
  && R CMD INSTALL 0.5.1.tar.gz \
  && rm 0.5.1.tar.gz \
  && wget https://github.com/cran/markdown/archive/0.7.7.tar.gz \
  && R CMD INSTALL 0.7.7.tar.gz \
  && rm 0.7.7.tar.gz \
  && wget https://github.com/cran/knitr/archive/1.12.3.tar.gz \
  && R CMD INSTALL 1.12.3.tar.gz \
  && rm 1.12.3.tar.gz \
  && wget https://github.com/cran/bitops/archive/1.0-6.tar.gz \
  && R CMD INSTALL 1.0-6.tar.gz \
  && rm 1.0-6.tar.gz \
  && wget https://github.com/cran/caTools/archive/1.17.1.tar.gz \
  && R CMD INSTALL 1.17.1.tar.gz \
  && rm 1.17.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/htmltools_0.3.5.tar.gz \
  && R CMD INSTALL htmltools_0.3.5.tar.gz \
  && rm htmltools_0.3.5.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/rmarkdown_0.9.6.tar.gz \
  && R CMD INSTALL rmarkdown_0.9.6.tar.gz \
  && rm rmarkdown_0.9.6.tar.gz

## Install covr and dependencies
RUN wget https://cran.rstudio.com/src/contrib/rex_1.1.1.tar.gz \
  && R CMD INSTALL rex_1.1.1.tar.gz \
  && rm rex_1.1.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/covr_2.0.1.tar.gz \
  && R CMD INSTALL covr_2.0.1.tar.gz \
  && rm covr_2.0.1.tar.gz

## Install ggplot2 and dependencies
RUN wget https://github.com/cran/colorspace/archive/1.2-6.tar.gz \
  && R CMD INSTALL 1.2-6.tar.gz \
  && rm 1.2-6.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/munsell_0.4.3.tar.gz \
  && R CMD INSTALL munsell_0.4.3.tar.gz \
  && rm munsell_0.4.3.tar.gz \
  && wget https://github.com/cran/RColorBrewer/archive/1.1-2.tar.gz \
  && R CMD INSTALL 1.1-2.tar.gz \
  && rm 1.1-2.tar.gz \
  && wget https://github.com/cran/dichromat/archive/2.0-0.tar.gz \
  && R CMD INSTALL 2.0-0.tar.gz \
  && rm 2.0-0.tar.gz \
  && wget https://github.com/cran/labeling/archive/0.3.tar.gz \
  && R CMD INSTALL 0.3.tar.gz \
  && rm 0.3.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/scales_0.4.0.tar.gz \
  && R CMD INSTALL scales_0.4.0.tar.gz \
  && rm scales_0.4.0.tar.gz \
  && wget https://github.com/cran/reshape2/archive/1.4.1.tar.gz \
  && R CMD INSTALL 1.4.1.tar.gz \
  && rm 1.4.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/gtable_0.2.0.tar.gz \
  && R CMD INSTALL gtable_0.2.0.tar.gz \
  && rm gtable_0.2.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/ggplot2_2.1.0.tar.gz \
  && R CMD INSTALL ggplot2_2.1.0.tar.gz \
  && rm ggplot2_2.1.0.tar.gz

## Install xtable
RUN wget https://cran.rstudio.com/src/contrib/xtable_1.8-2.tar.gz \
  && R CMD INSTALL xtable_1.8-2.tar.gz \
  && rm xtable_1.8-2.tar.gz

## Install igraph and its dependencies
RUN wget https://github.com/cran/registry/archive/0.3.tar.gz \
  && R CMD INSTALL 0.3.tar.gz \
  && rm 0.3.tar.gz \
  && wget https://github.com/cran/pkgmaker/archive/0.22.tar.gz \
  && R CMD INSTALL 0.22.tar.gz \
  && rm 0.22.tar.gz \
  && wget https://github.com/cran/rngtools/archive/1.2.4.tar.gz \
  && R CMD INSTALL 1.2.4.tar.gz \
  && rm 1.2.4.tar.gz \
  && wget https://github.com/cran/gridBase/archive/0.4-7.tar.gz \
  && R CMD INSTALL 0.4-7.tar.gz \
  && rm 0.4-7.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/iterators_1.0.8.tar.gz \
  && R CMD INSTALL iterators_1.0.8.tar.gz \
  && rm iterators_1.0.8.tar.gz \
  && wget https://github.com/cran/foreach/archive/1.4.3.tar.gz \
  && R CMD INSTALL 1.4.3.tar.gz \
  && rm 1.4.3.tar.gz \
  && wget https://github.com/cran/doParallel/archive/1.0.10.tar.gz \
  && R CMD INSTALL 1.0.10.tar.gz \
  && rm 1.0.10.tar.gz \
  && wget https://github.com/cran/NMF/archive/0.20.6.tar.gz \
  && R CMD INSTALL 0.20.6.tar.gz \
  && rm 0.20.6.tar.gz \
  && wget https://github.com/cran/irlba/archive/2.0.0.tar.gz \
  && R CMD INSTALL 2.0.0.tar.gz \
  && rm 2.0.0.tar.gz \
  && wget https://github.com/cran/igraph/archive/1.0.1.tar.gz \
  && R CMD INSTALL 1.0.1.tar.gz \
  && rm 1.0.1.tar.gz

## install lintr and dependencies
RUN wget https://github.com/cran/stringdist/archive/0.9.4.1.tar.gz \
  && R CMD INSTALL 0.9.4.1.tar.gz \
  && rm 0.9.4.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/lintr_1.0.0.tar.gz \
  && R CMD INSTALL lintr_1.0.0.tar.gz \
  && rm lintr_1.0.0.tar.gz

## install sp
RUN wget https://cran.rstudio.com/src/contrib/sp_1.2-3.tar.gz \
  && R CMD INSTALL sp_1.2-3.tar.gz \
  && rm sp_1.2-3.tar.gz

## install tidyr
RUN wget https://github.com/cran/tidyr/archive/0.4.1.tar.gz \
  && R CMD INSTALL 0.4.1.tar.gz \
  && rm 0.4.1.tar.gz

## install lme4
RUN wget https://github.com/cran/minqa/archive/1.2.4.tar.gz \
  && R CMD INSTALL 1.2.4.tar.gz \
  && rm 1.2.4.tar.gz \
  && wget https://github.com/cran/nloptr/archive/1.0.4.tar.gz \
  && R CMD INSTALL 1.0.4.tar.gz \
  && rm 1.0.4.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/RcppEigen_0.3.2.8.1.tar.gz \
  && R CMD INSTALL RcppEigen_0.3.2.8.1.tar.gz \
  && rm RcppEigen_0.3.2.8.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/lme4_1.1-12.tar.gz \
  && R CMD INSTALL lme4_1.1-12.tar.gz \
  && rm lme4_1.1-12.tar.gz

## install optimx and dependencies
RUN wget https://github.com/cran/numDeriv/archive/2014.2-1.tar.gz \
  && R CMD INSTALL 2014.2-1.tar.gz \
  && rm 2014.2-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/optextras_2013-10.28.tar.gz \
  && R CMD INSTALL optextras_2013-10.28.tar.gz \
  && rm optextras_2013-10.28.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Rvmmin_2013-11.12.tar.gz \
  && R CMD INSTALL Rvmmin_2013-11.12.tar.gz \
  && rm Rvmmin_2013-11.12.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Rcgmin_2013-2.21.tar.gz \
  && R CMD INSTALL Rcgmin_2013-2.21.tar.gz \
  && rm Rcgmin_2013-2.21.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/quadprog_1.5-5.tar.gz \
  && R CMD INSTALL quadprog_1.5-5.tar.gz \
  && rm quadprog_1.5-5.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/BB_2014.10-1.tar.gz \
  && R CMD INSTALL BB_2014.10-1.tar.gz \
  && rm BB_2014.10-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/ucminf_1.1-3.tar.gz \
  && R CMD INSTALL ucminf_1.1-3.tar.gz \
  && rm ucminf_1.1-3.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/setRNG_2013.9-1.tar.gz \
  && R CMD INSTALL setRNG_2013.9-1.tar.gz \
  && rm setRNG_2013.9-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/dfoptim_2011.8-1.tar.gz \
  && R CMD INSTALL dfoptim_2011.8-1.tar.gz \
  && rm dfoptim_2011.8-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/svUnit_0.7-12.tar.gz \
  && R CMD INSTALL svUnit_0.7-12.tar.gz \
  && rm svUnit_0.7-12.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/optimx_2013.8.7.tar.gz \
  && R CMD INSTALL optimx_2013.8.7.tar.gz \
  && rm optimx_2013.8.7.tar.gz

## install INLA
RUN wget https://github.com/inbo/INLA/archive/v0.0-1455098891.tar.gz \
  && R CMD INSTALL v0.0-1455098891.tar.gz \
  && rm v0.0-1455098891.tar.gz

## install roxygen2 and dependencies
RUN wget https://github.com/cran/brew/archive/1.0-6.tar.gz \
  && R CMD INSTALL 1.0-6.tar.gz \
  && rm 1.0-6.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/roxygen2_5.0.1.tar.gz \
  && R CMD INSTALL roxygen2_5.0.1.tar.gz \
  && rm roxygen2_5.0.1.tar.gz

## install RSQLite
RUN wget https://github.com/cran/RSQLite/archive/1.0.0.tar.gz \
  && R CMD INSTALL 1.0.0.tar.gz \
  && rm 1.0.0.tar.gz

## install rmvtnorm
RUN wget https://cran.rstudio.com/src/contrib/mvtnorm_1.0-5.tar.gz \
  && R CMD INSTALL mvtnorm_1.0-5.tar.gz \
  && rm mvtnorm_1.0-5.tar.gz

## Start R
CMD ["R", "--no-save", "--no-restore"]
