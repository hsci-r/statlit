FROM rocker/binder:latest
COPY --chown=${NB_USER} DESCRIPTION ${HOME}
USER ${NB_USER}
RUN wget https://github.com/hsci-r/statlit/raw/main/DESCRIPTION
RUN Rscript -e "options(repos = c(hsci='https://hsci-r.r-universe.dev', getOption('repos'))); devtools::install_deps()"
COPY --chown=${NB_USER} . ${HOME}
