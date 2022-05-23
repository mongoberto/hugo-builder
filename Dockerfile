ARG HUGO_VERSION=0.91.2

FROM registry.gitlab.com/pages/hugo/hugo_extended:${HUGO_VERSION}

EXPOSE 1313

WORKDIR /src

RUN apk add --update --no-cache ruby openjdk11 go git

ARG ASCIIDOCTOR_VERSION=2.0.17
ARG ASCIIDOCTOR_HTML5S_VERSION=0.5.1
ARG ASCIIDOCTOR_DIAGRAM_VERSION=2.2.3
ARG ASCIIDOCTOR_DIAGRAM_DITAA_VERSION=1.0.3
ARG ASCIIDOCTOR_DIAGRAM_PLANTUML_VERSION=1.2022.5

RUN gem install --no-document "asciidoctor:${ASCIIDOCTOR_VERSION}" \
  && gem install --no-document --ignore-dependencies "asciidoctor-html5s:${ASCIIDOCTOR_HTML5S_VERSION}" \
  && gem install --no-document --ignore-dependencies "asciidoctor-diagram:${ASCIIDOCTOR_DIAGRAM_VERSION}" \
  && gem install --no-document --ignore-dependencies "asciidoctor-diagram-ditaamini:${ASCIIDOCTOR_DIAGRAM_DITAA_VERSION}" \
  && gem install --no-document --ignore-dependencies "asciidoctor-diagram-plantuml:${ASCIIDOCTOR_DIAGRAM_PLANTUML_VERSION}"

ENV PATH="/src/bin:${PATH}"
