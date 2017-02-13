FROM inbobmk/rlatex:3.3.2

## This handle reaches Thierry
MAINTAINER "Thierry Onkelinx" thierry.onkelinx@inbo.be

## Install devtools and dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    git \
    libssl-dev \
    libssh2-1-dev \
  && apt-get clean \
  && wget https://cran.rstudio.com/src/contrib/Archive/jsonlite/jsonlite_1.1.tar.gz \
  && R CMD INSTALL jsonlite_1.1.tar.gz \
  && rm jsonlite_1.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/mime_0.5.tar.gz \
  && R CMD INSTALL mime_0.5.tar.gz \
  && rm mime_0.5.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/curl/curl_2.2.tar.gz \
  && R CMD INSTALL curl_2.2.tar.gz \
  && rm curl_2.2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/digest_0.6.12.tar.gz \
  && R CMD INSTALL digest_0.6.12.tar.gz \
  && rm digest_0.6.12.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/R6_2.2.0.tar.gz \
  && R CMD INSTALL R6_2.2.0.tar.gz \
  && rm R6_2.2.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/magrittr_1.5.tar.gz \
  && R CMD INSTALL magrittr_1.5.tar.gz \
  && rm magrittr_1.5.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/stringi_1.1.2.tar.gz \
  && R CMD INSTALL stringi_1.1.2.tar.gz \
  && rm stringi_1.1.2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/stringr_1.1.0.tar.gz \
  && R CMD INSTALL stringr_1.1.0.tar.gz \
  && rm stringr_1.1.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/openssl/openssl_0.9.5.tar.gz \
  && R CMD INSTALL openssl_0.9.5.tar.gz \
  && rm openssl_0.9.5.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/httr_1.2.1.tar.gz \
  && R CMD INSTALL httr_1.2.1.tar.gz \
  && rm httr_1.2.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/git2r/git2r_0.15.0.tar.gz \
  && R CMD INSTALL git2r_0.15.0.tar.gz  \
  && rm git2r_0.15.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/memoise_1.0.0.tar.gz \
  && R CMD INSTALL memoise_1.0.0.tar.gz \
  && rm memoise_1.0.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/whisker_0.3-2.tar.gz \
  && R CMD INSTALL whisker_0.3-2.tar.gz \
  && rm whisker_0.3-2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/rstudioapi_0.6.tar.gz \
  && R CMD INSTALL rstudioapi_0.6.tar.gz \
  && rm rstudioapi_0.6.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/withr_1.0.2.tar.gz \
  && R CMD INSTALL withr_1.0.2.tar.gz \
  && rm withr_1.0.2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/devtools_1.12.0.tar.gz \
  && R CMD INSTALL devtools_1.12.0.tar.gz \
  && rm devtools_1.12.0.tar.gz

## Install assertthat
RUN wget https://cran.rstudio.com/src/contrib/assertthat_0.1.tar.gz \
  && R CMD INSTALL assertthat_0.1.tar.gz \
  && rm assertthat_0.1.tar.gz

## Install dplyr and dependencies
RUN wget https://cran.rstudio.com/src/contrib/Archive/Rcpp/Rcpp_0.12.7.tar.gz \
  && R CMD INSTALL Rcpp_0.12.7.tar.gz \
  && rm Rcpp_0.12.7.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/lazyeval_0.2.0.tar.gz\
  && R CMD INSTALL lazyeval_0.2.0.tar.gz \
  && rm lazyeval_0.2.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/DBI_0.5-1.tar.gz \
  && R CMD INSTALL DBI_0.5-1.tar.gz \
  && rm DBI_0.5-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/BH/BH_1.60.0-2.tar.gz \
  && R CMD INSTALL BH_1.60.0-2.tar.gz \
  && rm BH_1.60.0-2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/tibble_1.2.tar.gz \
  && R CMD INSTALL tibble_1.2.tar.gz \
  && rm tibble_1.2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/dplyr_0.5.0.tar.gz \
  && R CMD INSTALL dplyr_0.5.0.tar.gz \
  && rm dplyr_0.5.0.tar.gz

## Install plyr
RUN wget https://cran.rstudio.com/src/contrib/plyr_1.8.4.tar.gz \
  && R CMD INSTALL plyr_1.8.4.tar.gz \
  && rm plyr_1.8.4.tar.gz

## Install lubridate
RUN wget https://cran.rstudio.com/src/contrib/lubridate_1.6.0.tar.gz \
  && R CMD INSTALL lubridate_1.6.0.tar.gz \
  && rm lubridate_1.6.0.tar.gz

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
  && apt-get clean \
  && wget https://cran.rstudio.com/src/contrib/RODBC_1.3-14.tar.gz \
  && R CMD INSTALL RODBC_1.3-14.tar.gz \
  && rm RODBC_1.3-14.tar.gz

## Install testthat and dependencies
RUN wget https://cran.rstudio.com/src/contrib/crayon_1.3.2.tar.gz \
  && R CMD INSTALL crayon_1.3.2.tar.gz \
  && rm crayon_1.3.2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/praise_1.0.0.tar.gz \
  && R CMD INSTALL praise_1.0.0.tar.gz \
  && rm praise_1.0.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/testthat_1.0.2.tar.gz \
  && R CMD INSTALL testthat_1.0.2.tar.gz \
  && rm testthat_1.0.2.tar.gz

## Install rmarkdown and dependencies
RUN wget https://cran.rstudio.com/src/contrib/yaml_2.1.14.tar.gz \
  && R CMD INSTALL yaml_2.1.14.tar.gz \
  && rm yaml_2.1.14.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/evaluate_0.10.tar.gz \
  && R CMD INSTALL evaluate_0.10.tar.gz \
  && rm evaluate_0.10.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/formatR_1.4.tar.gz \
  && R CMD INSTALL formatR_1.4.tar.gz \
  && rm formatR_1.4.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/highr_0.6.tar.gz \
  && R CMD INSTALL highr_0.6.tar.gz \
  && rm highr_0.6.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/markdown_0.7.7.tar.gz \
  && R CMD INSTALL markdown_0.7.7.tar.gz \
  && rm markdown_0.7.7.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/knitr/knitr_1.15.tar.gz \
  && R CMD INSTALL knitr_1.15.tar.gz \
  && rm knitr_1.15.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/bitops_1.0-6.tar.gz \
  && R CMD INSTALL bitops_1.0-6.tar.gz \
  && rm bitops_1.0-6.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/caTools_1.17.1.tar.gz \
  && R CMD INSTALL caTools_1.17.1.tar.gz \
  && rm caTools_1.17.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/htmltools_0.3.5.tar.gz \
  && R CMD INSTALL htmltools_0.3.5.tar.gz \
  && rm htmltools_0.3.5.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/base64enc_0.1-3.tar.gz \
  && R CMD INSTALL base64enc_0.1-3.tar.gz \
  && rm base64enc_0.1-3.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/rmarkdown/rmarkdown_1.1.tar.gz \
  && R CMD INSTALL rmarkdown_1.1.tar.gz \
  && rm rmarkdown_1.1.tar.gz

## Install covr and dependencies
RUN wget https://cran.rstudio.com/src/contrib/rex_1.1.1.tar.gz \
  && R CMD INSTALL rex_1.1.1.tar.gz \
  && rm rex_1.1.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/covr/covr_2.2.1.tar.gz \
  && R CMD INSTALL covr_2.2.1.tar.gz \
  && rm covr_2.2.1.tar.gz

## Install ggplot2 and dependencies
RUN wget https://cran.rstudio.com/src/contrib/Archive/colorspace/colorspace_1.3-0.tar.gz \
  && R CMD INSTALL colorspace_1.3-0.tar.gz \
  && rm colorspace_1.3-0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/munsell_0.4.3.tar.gz \
  && R CMD INSTALL munsell_0.4.3.tar.gz \
  && rm munsell_0.4.3.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/RColorBrewer_1.1-2.tar.gz \
  && R CMD INSTALL RColorBrewer_1.1-2.tar.gz \
  && rm RColorBrewer_1.1-2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/dichromat_2.0-0.tar.gz \
  && R CMD INSTALL dichromat_2.0-0.tar.gz \
  && rm dichromat_2.0-0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/labeling_0.3.tar.gz \
  && R CMD INSTALL labeling_0.3.tar.gz \
  && rm labeling_0.3.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/scales_0.4.1.tar.gz \
  && R CMD INSTALL scales_0.4.1.tar.gz \
  && rm scales_0.4.1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/reshape2_1.4.2.tar.gz \
  && R CMD INSTALL reshape2_1.4.2.tar.gz \
  && rm reshape2_1.4.2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/gtable_0.2.0.tar.gz \
  && R CMD INSTALL gtable_0.2.0.tar.gz \
  && rm gtable_0.2.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/ggplot2/ggplot2_2.2.0.tar.gz \
  && R CMD INSTALL ggplot2_2.2.0.tar.gz \
  && rm ggplot2_2.2.0.tar.gz

## Install xtable
RUN wget https://cran.rstudio.com/src/contrib/xtable_1.8-2.tar.gz \
  && R CMD INSTALL xtable_1.8-2.tar.gz \
  && rm xtable_1.8-2.tar.gz

## Install igraph and its dependencies
RUN wget https://cran.rstudio.com/src/contrib/registry_0.3.tar.gz \
  && R CMD INSTALL registry_0.3.tar.gz \
  && rm registry_0.3.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/pkgmaker_0.22.tar.gz \
  && R CMD INSTALL pkgmaker_0.22.tar.gz \
  && rm pkgmaker_0.22.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/rngtools_1.2.4.tar.gz \
  && R CMD INSTALL rngtools_1.2.4.tar.gz \
  && rm rngtools_1.2.4.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/gridBase_0.4-7.tar.gz \
  && R CMD INSTALL gridBase_0.4-7.tar.gz \
  && rm gridBase_0.4-7.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/iterators_1.0.8.tar.gz \
  && R CMD INSTALL iterators_1.0.8.tar.gz \
  && rm iterators_1.0.8.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/foreach_1.4.3.tar.gz \
  && R CMD INSTALL foreach_1.4.3.tar.gz \
  && rm foreach_1.4.3.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/doParallel_1.0.10.tar.gz \
  && R CMD INSTALL doParallel_1.0.10.tar.gz \
  && rm doParallel_1.0.10.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/NMF_0.20.6.tar.gz \
  && R CMD INSTALL NMF_0.20.6.tar.gz \
  && rm NMF_0.20.6.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/irlba_2.1.2.tar.gz \
  && R CMD INSTALL irlba_2.1.2.tar.gz \
  && rm irlba_2.1.2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/igraph_1.0.1.tar.gz \
  && R CMD INSTALL igraph_1.0.1.tar.gz \
  && rm igraph_1.0.1.tar.gz

## install lintr and dependencies
RUN wget https://cran.rstudio.com/src/contrib/Archive/stringdist/stringdist_0.9.4.2.tar.gz \
  && R CMD INSTALL stringdist_0.9.4.2.tar.gz \
  && rm stringdist_0.9.4.2.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/lintr_1.0.0.tar.gz \
  && R CMD INSTALL lintr_1.0.0.tar.gz \
  && rm lintr_1.0.0.tar.gz

## install sp
RUN wget https://cran.rstudio.com/src/contrib/Archive/sp/sp_1.2-3.tar.gz \
  && R CMD INSTALL sp_1.2-3.tar.gz \
  && rm sp_1.2-3.tar.gz

## install tidyr
RUN wget https://cran.rstudio.com/src/contrib/Archive/tidyr/tidyr_0.6.0.tar.gz \
  && R CMD INSTALL tidyr_0.6.0.tar.gz \
  && rm tidyr_0.6.0.tar.gz

## install lme4
RUN wget https://cran.rstudio.com/src/contrib/minqa_1.2.4.tar.gz \
  && R CMD INSTALL minqa_1.2.4.tar.gz \
  && rm minqa_1.2.4.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/nloptr_1.0.4.tar.gz \
  && R CMD INSTALL nloptr_1.0.4.tar.gz \
  && rm nloptr_1.0.4.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/RcppEigen_0.3.2.9.0.tar.gz \
  && R CMD INSTALL RcppEigen_0.3.2.9.0.tar.gz \
  && rm RcppEigen_0.3.2.9.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/lme4_1.1-12.tar.gz \
  && R CMD INSTALL lme4_1.1-12.tar.gz \
  && rm lme4_1.1-12.tar.gz

## install optimx and dependencies
RUN wget https://cran.rstudio.com/src/contrib/numDeriv_2016.8-1.tar.gz \
  && R CMD INSTALL numDeriv_2016.8-1.tar.gz \
  && rm numDeriv_2016.8-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/optextras_2016-8.8.tar.gz \
  && R CMD INSTALL optextras_2016-8.8.tar.gz \
  && rm optextras_2016-8.8.tar.gz \
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
  && wget https://cran.rstudio.com/src/contrib/ucminf_1.1-4.tar.gz \
  && R CMD INSTALL ucminf_1.1-4.tar.gz \
  && rm ucminf_1.1-4.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/setRNG_2013.9-1.tar.gz \
  && R CMD INSTALL setRNG_2013.9-1.tar.gz \
  && rm setRNG_2013.9-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/dfoptim_2016.7-1.tar.gz \
  && R CMD INSTALL dfoptim_2016.7-1.tar.gz \
  && rm dfoptim_2016.7-1.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/svUnit_0.7-12.tar.gz \
  && R CMD INSTALL svUnit_0.7-12.tar.gz \
  && rm svUnit_0.7-12.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/optimx_2013.8.7.tar.gz \
  && R CMD INSTALL optimx_2013.8.7.tar.gz \
  && rm optimx_2013.8.7.tar.gz

## install INLA
RUN wget https://github.com/inbo/INLA/archive/v0.0-1468872408.tar.gz \
  && R CMD INSTALL v0.0-1468872408.tar.gz \
  && rm v0.0-1468872408.tar.gz

## install roxygen2 and dependencies
RUN wget https://cran.rstudio.com/src/contrib/brew_1.0-6.tar.gz \
  && R CMD INSTALL brew_1.0-6.tar.gz \
  && rm brew_1.0-6.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/Archive/roxygen2/roxygen2_5.0.1.tar.gz \
  && R CMD INSTALL roxygen2_5.0.1.tar.gz \
  && rm roxygen2_5.0.1.tar.gz

## install RSQLite
RUN wget https://cran.rstudio.com/src/contrib/Archive/RSQLite/RSQLite_1.0.0.tar.gz \
  && R CMD INSTALL RSQLite_1.0.0.tar.gz \
  && rm RSQLite_1.0.0.tar.gz

## install rmvtnorm
RUN wget https://cran.rstudio.com/src/contrib/mvtnorm_1.0-5.tar.gz \
  && R CMD INSTALL mvtnorm_1.0-5.tar.gz \
  && rm mvtnorm_1.0-5.tar.gz

## install snowfall
RUN wget https://cran.rstudio.com/src/contrib/snow_0.4-2.tar.gz \
  && R CMD INSTALL snow_0.4-2.tar.gz \
  && rm snow_0.4-2.tar.gz\
  && wget https://cran.rstudio.com/src/contrib/snowfall_1.84-6.1.tar.gz \
  && R CMD INSTALL snowfall_1.84-6.1.tar.gz \
  && rm snowfall_1.84-6.1.tar.gz

## install rgeos
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     libgeos++-dev \
  && wget https://cran.rstudio.com/src/contrib/Archive/rgeos/rgeos_0.3-21.tar.gz \
  && R CMD INSTALL rgeos_0.3-21.tar.gz \
  && rm rgeos_0.3-21.tar.gz

## install multimput
RUN wget https://github.com/inbo/multimput/archive/v0.2.5.tar.gz \
  && R CMD INSTALL v0.2.5.tar.gz \
  && rm v0.2.5.tar.gz

## install aws.s3
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libxml2-dev \
  && wget https://cran.rstudio.com/src/contrib/xml2_1.1.0.tar.gz \
  && R CMD INSTALL xml2_1.1.0.tar.gz \
  && rm xml2_1.1.0.tar.gz \
  && wget https://cran.rstudio.com/src/contrib/aws.signature_0.2.6.tar.gz \
  && R CMD INSTALL aws.signature_0.2.6.tar.gz \
  && rm aws.signature_0.2.6.tar.gz \
  && Rscript -e "devtools::install_github('cloudyr/aws.s3', ref = '72edc122c763bf9e8db546a8c8c22794659b110d', dependencies = FALSE, upgrade_dependencies = FALSE)"

## install RPostgreSQL
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libpq-dev \
  && wget https://cran.rstudio.com/src/contrib/RPostgreSQL_0.4-1.tar.gz \
  && R CMD INSTALL RPostgreSQL_0.4-1.tar.gz \
  && rm RPostgreSQL_0.4-1.tar.gz

## Start R
CMD ["R", "--no-save", "--no-restore"]
