FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y software-properties-common wget \
    && add-apt-repository ppa:alex-p/tesseract-ocr5 \
    && apt-get update \
    && apt-get upgrade -y \
    && apt install -y tesseract-ocr \
    tesseract-ocr-jpn \
    tesseract-ocr-jpn-vert \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ENV TESSDATA_PREFIX="/usr/local/share/tessdata"

#RUN wget https://github.com/tesseract-ocr/tessdata_best/raw/main/eng.traineddata -P ${TESSDATA_PREFIX} \
#   && wget https://github.com/tesseract-ocr/tessdata_best/raw/main/jpn.traineddata -P ${TESSDATA_PREFIX} \
#   && wget https://github.com/tesseract-ocr/tessdata_best/raw/main/jpn_vert.traineddata -P ${TESSDATA_PREFIX}

