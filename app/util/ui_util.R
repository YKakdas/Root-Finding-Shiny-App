create_box_for_function_text <- function(text_input_id, height) {
  box(
    title = "Function",
    width = 6,
    height = height,
    solidHeader = TRUE,
    status = "primary",
    textInput(text_input_id, h3("Function Input(x)"),
              placeholder = "Enter function..."),
  )
}

create_box_for_single_initial_value <- function(text_input_id) {
  box(
    title = "Initial Value",
    width = 6,
    height = "50%",
    solidHeader = TRUE,
    status = "primary",
    textInput(text_input_id, h3("Initial Value"),
              placeholder = "Enter initial value...")
    
  )
}

create_box_for_multiple_initial_values <-
  function(start_text_input_id,
           end_text_input_id,
           first_title = "Initial interval start value",
           first_placeholder = "Enter start...",
           second_title = "Initial interval end value",
           second_placeholder = "Enter end...") {
    box(
      title = "Initial Values",
      width = 6,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      textInput(
        start_text_input_id,
        h4(first_title),
        placeholder = first_placeholder
      ),
      textInput(
        end_text_input_id,
        h4(second_title),
        placeholder = second_placeholder
      )
      
    )
  }

create_box_for_max_iter <- function(slider_id) {
  box(
    title = "Number of Maximum Iterations",
    width = 6,
    height = "50%",
    solidHeader = TRUE,
    status = "primary",
    sliderInput(
      slider_id,
      h4('Select the max iteration value'),
      min = 100,
      max = 1000,
      value = 100,
      step = 1,
      round = 0
    )
  )
}

create_box_for_tolerance <- function(slider_id) {
  box(
    title = "Tolerance",
    width = 6,
    height = "50%",
    solidHeader = TRUE,
    status = "primary",
    sliderInput(
      slider_id,
      h4('Select the tolerance value'),
      min = -12,
      max = -6,
      value = -9
    )
  )
}

create_action_button_for_calculation <- function(button_id) {
  actionButton(button_id, "Calculate")
}

create_action_button_for_reset <- function(button_id) {
  actionButton(button_id, "Reset")
}

create_popup_window <-
  function(modal_id,
           plot_id,
           download_button_id,
           root_finding_name) {
    mainPanel(bsModal(
      modal_id,
      paste0(root_finding_name, " Plot"),
      "NONE",
      size = "large",
      plotOutput(plot_id),
      downloadButton(download_button_id, 'Download')
    ))
  }

create_box_for_html <- function(id, path) {
  box(
    id = id,
    title = "Info",
    width = 12,
    height = "50%",
    solidHeader = TRUE,
    status = "warning",
    includeHTML(path),
    collapsible = T
  )
}