#!/bin/zsh

rm -rf checked-out checked-out-ref
mkdir -p checked-out

# Clona apenas o projeto 025
(cd checked-out; git clone git@gitlab.rnl.tecnico.ulisboa.pt:leic-a-co25/prj/025.git)

cp -a checked-out checked-out-ref

# Faz checkout da versão mais recente antes da data específica
(cd checked-out-ref/025; git -c advice.detachedHead=false checkout `git rev-list -1 --date=iso --before="2025-05-16T17:10:00+00:00" master`)

# Remove histórico Git
rm -rf checked-out-ref/025/.git
rm -rf checked-out/025/.git
