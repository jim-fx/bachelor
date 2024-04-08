FROM node:slim

WORKDIR /var/local

# combine into one run command to reduce image size
RUN apt-get update && apt-get install -y perl wget libfontconfig1 make git && \
    wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh  && \
    apt-get clean

ENV PATH="${PATH}:/root/bin"

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
    todonotes \
    geometry \
    babel  \
    bookmark \
    ulem \
    oberdiek \
    lipsum \
    wrapfig \
    biblatex && \
    tlmgr path add

# Set the working directory
WORKDIR /data

# Entry point
CMD ["sh"]
