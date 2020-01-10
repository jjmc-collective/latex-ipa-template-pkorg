# Required Tools Installed
# ---------------------------
# - gcc
# - latexmk
# - pdflatex
# - pandoc

CXX = g++
CXXFLAGS = -Wall -Werror -Wextra -pedantic -std=c++17 -g -fsanitize=address
LDFLAGS =  -fsanitize=address
REPORT_NAME = report
OUT_DIR = dist/

all: clean setup report keynote pub

setup:
		mkdir -p ${OUT_DIR}

report: report.tex
		latexmk -bibtex -diagnostics -jobname=${REPORT_NAME} --file-line-error --interaction=nonstopmode -pdf report.tex
pub:
		cp ${REPORT_NAME}.pdf ${OUT_DIR}

clean:
		latexmk -CA
		rm -f *.log
		rm -f *.fls
		rm -f *.nav
		rm -f *.aux
		rm -f *.out
		rm -f *.toc
		rm -f *.snm
		rm -rf dist
		rm -f ${REPORT_NAME}.pdf

