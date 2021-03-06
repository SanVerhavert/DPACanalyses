
# This file is automatically generated, you probably don't want to edit this

relEvolOptions <- if (requireNamespace('jmvcore')) R6::R6Class(
    "relEvolOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            Judge = NULL,
            Repr1 = NULL,
            Repr2 = NULL,
            Selected = NULL,
            OrderOn = NULL,
            rel70 = FALSE,
            rel80 = FALSE,
            relMax = FALSE,
            nJudges = FALSE,
            judgeRounds = FALSE, ...) {

            super$initialize(
                package='DPACanalyses',
                name='relEvol',
                requiresData=TRUE,
                ...)
        
            private$..Judge <- jmvcore::OptionVariable$new(
                "Judge",
                Judge)
            private$..Repr1 <- jmvcore::OptionVariable$new(
                "Repr1",
                Repr1)
            private$..Repr2 <- jmvcore::OptionVariable$new(
                "Repr2",
                Repr2)
            private$..Selected <- jmvcore::OptionVariable$new(
                "Selected",
                Selected)
            private$..OrderOn <- jmvcore::OptionVariable$new(
                "OrderOn",
                OrderOn)
            private$..rel70 <- jmvcore::OptionBool$new(
                "rel70",
                rel70,
                default=FALSE)
            private$..rel80 <- jmvcore::OptionBool$new(
                "rel80",
                rel80,
                default=FALSE)
            private$..relMax <- jmvcore::OptionBool$new(
                "relMax",
                relMax,
                default=FALSE)
            private$..nJudges <- jmvcore::OptionBool$new(
                "nJudges",
                nJudges,
                default=FALSE)
            private$..judgeRounds <- jmvcore::OptionBool$new(
                "judgeRounds",
                judgeRounds,
                default=FALSE)
        
            self$.addOption(private$..Judge)
            self$.addOption(private$..Repr1)
            self$.addOption(private$..Repr2)
            self$.addOption(private$..Selected)
            self$.addOption(private$..OrderOn)
            self$.addOption(private$..rel70)
            self$.addOption(private$..rel80)
            self$.addOption(private$..relMax)
            self$.addOption(private$..nJudges)
            self$.addOption(private$..judgeRounds)
        }),
    active = list(
        Judge = function() private$..Judge$value,
        Repr1 = function() private$..Repr1$value,
        Repr2 = function() private$..Repr2$value,
        Selected = function() private$..Selected$value,
        OrderOn = function() private$..OrderOn$value,
        rel70 = function() private$..rel70$value,
        rel80 = function() private$..rel80$value,
        relMax = function() private$..relMax$value,
        nJudges = function() private$..nJudges$value,
        judgeRounds = function() private$..judgeRounds$value),
    private = list(
        ..Judge = NA,
        ..Repr1 = NA,
        ..Repr2 = NA,
        ..Selected = NA,
        ..OrderOn = NA,
        ..rel70 = NA,
        ..rel80 = NA,
        ..relMax = NA,
        ..nJudges = NA,
        ..judgeRounds = NA)
)

relEvolResults <- if (requireNamespace('jmvcore')) R6::R6Class(
    inherit = jmvcore::Group,
    active = list(
        debugText = function() private$..debugText,
        Warning = function() private$..Warning,
        table = function() private$..table,
        reliabPlot = function() private$..reliabPlot,
        judgePlot = function() private$..judgePlot),
    private = list(
        ..debugText = NA,
        ..Warning = NA,
        ..table = NA,
        ..reliabPlot = NA,
        ..judgePlot = NA),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="Reliability evolution")
            private$..debugText <- jmvcore::Preformatted$new(
                options=options,
                name="debugText",
                title="Debug",
                visible=FALSE)
            private$..Warning <- jmvcore::Preformatted$new(
                options=options,
                name="Warning",
                title="",
                visible=FALSE)
            private$..table <- jmvcore::Table$new(
                options=options,
                name="table",
                title="Reliability Evolution",
                columns=list(
                    list(
                        `name`="RoundNo", 
                        `title`="Round number", 
                        `type`="integer"),
                    list(
                        `name`="Rel", 
                        `title`="Reliability", 
                        `type`="number"),
                    list(
                        `name`="Returns", 
                        `title`="Returns", 
                        `type`="number")))
            private$..reliabPlot <- jmvcore::Image$new(
                options=options,
                name="reliabPlot",
                title="",
                width=600,
                height=500,
                renderFun=".evolPlot")
            private$..judgePlot <- jmvcore::Image$new(
                options=options,
                name="judgePlot",
                title="",
                width=600,
                height=500,
                renderFun=".judgeRound",
                visible=FALSE)
            self$add(private$..debugText)
            self$add(private$..Warning)
            self$add(private$..table)
            self$add(private$..reliabPlot)
            self$add(private$..judgePlot)}))

relEvolBase <- if (requireNamespace('jmvcore')) R6::R6Class(
    "relEvolBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = 'DPACanalyses',
                name = 'relEvol',
                version = c(1,0,0),
                options = options,
                results = relEvolResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE)
        }))

#' Reliability Evolution
#'
#' 
#' @param data .
#' @param Judge .
#' @param Repr1 .
#' @param Repr2 .
#' @param Selected .
#' @param OrderOn .
#' @param rel70 .
#' @param rel80 .
#' @param relMax .
#' @param nJudges .
#' @param judgeRounds .
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$debugText} \tab \tab \tab \tab \tab a preformatted \cr
#'   \code{results$Warning} \tab \tab \tab \tab \tab a preformatted \cr
#'   \code{results$table} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$reliabPlot} \tab \tab \tab \tab \tab an image \cr
#'   \code{results$judgePlot} \tab \tab \tab \tab \tab an image \cr
#' }
#'
#' Tables can be converted to data frames with \code{asDF} or \code{\link{as.data.frame}}. For example:
#'
#' \code{results$table$asDF}
#'
#' \code{as.data.frame(results$table)}
#'
#' @export
relEvol <- function(
    data,
    Judge,
    Repr1,
    Repr2,
    Selected,
    OrderOn,
    rel70 = FALSE,
    rel80 = FALSE,
    relMax = FALSE,
    nJudges = FALSE,
    judgeRounds = FALSE) {

    if ( ! requireNamespace('jmvcore'))
        stop('relEvol requires jmvcore to be installed (restart may be required)')

    options <- relEvolOptions$new(
        Judge = Judge,
        Repr1 = Repr1,
        Repr2 = Repr2,
        Selected = Selected,
        OrderOn = OrderOn,
        rel70 = rel70,
        rel80 = rel80,
        relMax = relMax,
        nJudges = nJudges,
        judgeRounds = judgeRounds)

    results <- relEvolResults$new(
        options = options)

    analysis <- relEvolClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}
