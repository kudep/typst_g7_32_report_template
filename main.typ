#set text(font: "Times New Roman")

// DONE: межстрочный интервал дял первых 2 страниц одинарный, а далее 1.5 

#set par(leading: 1.5em)
#import "packages/modern-g7-32/0.1.0/src/export.typ": gost, title-templates
#show: gost.with(
  title-template: title-templates.mipt-deeppavlov-lab,
  ministry: "Министерство науки и высшего образования Российской Федерации
Федеральное государственное автономное образовательное
учреждение высшего образования 
«МОСКОВСКИЙ ФИЗИКО-ТЕХНИЧЕСКИЙ ИНСТИТУТ
(НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ УНИВЕРСИТЕТ)»
(МФТИ, Физтех)",
  // organization: (
  //   full: "Полное наименование организации — исполнителя НИР",
  //   short: "Сокращённое наименование организации",
  // ),
  // DONE: Убрать : у УДК
  udk: "004.896",
  // research-number: "регистрационный номер НИР",
  // report-number: "регистрационный номер отчета",
  approved-by: (
    name: "В.В. Кондратьев",
    position: "Директор ИЦ\nприкладных систем ИИ\nд-р техн. наук",
    year: 2023
  ),
  agreed-by: (
    name: "С.Н. Гаричев",
    position: "Директор по исследованиям, разработкам и коммерциализации МФТИ\nд-р техн. наук",
    year: 2023
  ),
  report-type: "отчёт",
  about: "О научно-исследовательских работах\n«Персональные цифровые ассистенты с мультимодальными навыками»",
  // DONE: начиная с новой строки нужно в скобочках с мальнькой буквы вставить текст
  subject: "ОБОБЩЕНИЕ И ОЦЕНКА РЕЗУЛЬТАТОВ ИССЛЕДОВАНИЙ",
  // DONE: убрать дату
  manager: (name: "Попов А.В.", position: "заведующий лабораторией нейронных систем и глубокого обучения МФТИ"),
  city: "Долгопрудный",
  year: 2023,

// DONE: дополнить перформеров вкладом в скобочках, шрифт такой же как и подпись, дата
  performers: (
    (name: "А.В. Попов", position: "Руководитель НИР, заведующий лабораторией нейронных систем и глубокого обучения МФТИ", part: "введение, заключение"),
    (name: "Д.П. Кузнецов", position: "Старший исследователь", part: "раздел 1"),
    (name: "Д.П. Кузнецов", position: "Старший исследователь", part: "раздел 1"),
    (name: "Д.П. Кузнецов", position: "Старший исследователь", part: "раздел 1"),
    (name: "Д.П. Кузнецов", position: "Старший исследователь", part: "раздел 1"),
    (name: "Д.П. Кузнецов", position: "Старший исследователь", part: "раздел 1"),
  ),
)
#show heading.where(level: 1): set align(center)
#show heading.where(level: 2): set text(hyphenate: true)
#show heading.where(level: 3): set text(weight: "regular", hyphenate: true)
#show heading.where(level: 4): set text(weight: "regular", hyphenate: true)
#show heading.where(level: 5): set text(weight: "regular", hyphenate: true)
#set par(leading: 1em)

#include "parts/abstract.typ"
// DONE: гост не регламентирует, но лучше сделать отступы нод пунктов в 2 раза меньше (это просто желание)
// DONE: Список используемых источников должен быть с большой буквы
#outline(indent: 1.4em)

#include "parts/defs.typ"
#include "parts/intro.typ"

#set heading(numbering: "1.1.1", hanging-indent: -2.5em)
// DONE: все хедеры от 2 и далее должны быть растянуты по ширине окна (приоритет: 5) и должен быть отступ
// DONE: все хедеры от 3 должны быть не жирным, а обычным
#include "parts/part1.typ"

#set heading(numbering: none)
#include "parts/conclusion.typ"

// TODO: литература с абзацного отступа, нумерация смещается, а остальной текст нет
#bibliography("literature.bib")

// DONE: таблицы подписываются сверху, проверить!
#include "parts/appendix_a.typ"







