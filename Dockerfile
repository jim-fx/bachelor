
FROM ubuntu:bionic

WORKDIR /var/local

# combine into one run command to reduce image size
RUN apt-get update && apt-get install -y perl wget libfontconfig1 make git nodejs && \
    wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh  && \
    apt-get clean
ENV PATH="${PATH}:/root/bin"
# RUN tlmgr install xetex
# RUN fmtutil-sys --all

# Install additional TexLive packages using tlmgr
RUN tlmgr install --verify-repo=none \
    inconsolata \
    biber \
    fancyhdr \
    xkeyval \
    pgf \
    latexdiff \
    environ \
    babel-german \
    upquote \
    hyperref \
    tcolorbox \
    geometry \
    babel  \
    bookmark \
    ulem \
    oberdiek \
    biblatex && \
    tlmgr path add

# Set the working directory
WORKDIR /data

# Entry point
CMD ["sh"]
