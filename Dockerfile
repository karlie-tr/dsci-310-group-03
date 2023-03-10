FROM jupyter/r-notebook:r-4.1.3

RUN Rscript -e "install.packages('remotes', repos='https://cran.us.r-project.org')"

RUN Rscript -e "remotes::install_version('cowplot', '1.1.1', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('RColorBrewer', '1.1-2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('kknn', '1.3.1', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('testthat', '3.1.3', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('vdiffr', '1.0.5', repos = 'https://cloud.r-project.org')"