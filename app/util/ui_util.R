create_box_for_function_text <- function(text_input_id, height) {
  box(
    title = "Function",
    width = 12,
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
    width = 12,
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
      width = 12,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      textInput(start_text_input_id,
                h4(first_title),
                placeholder = first_placeholder),
      textInput(end_text_input_id,
                h4(second_title),
                placeholder = second_placeholder)
      
    )
  }

create_box_for_max_iter <- function(slider_id) {
  box(
    title = "Number of Maximum Iterations",
    width = 12,
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
    width = 12,
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

populate_id <-
  function(prefix,
           text_func_height,
           single_init,
           logify,
           onload,
           is_secant = F) {
    names <-
      list(
        popup = paste0(prefix, "_popup"),
        popup_plot = paste0(prefix, "_popup_plot"),
        download_plot = paste0(prefix, "_download_plot"),
        plot_name = paste0(toupper(substr(prefix, 1, 1)), substr(prefix, 2, nchar(prefix)), sep =
                             ""),
        logify =  logify,
        onload = onload,
        html_id = paste0(prefix, "_html"),
        html_path = paste0("html/", prefix, ".html"),
        func_text_id = paste0(prefix, "_text_function"),
        func_text_height = text_func_height,
        single_init = single_init,
        init_value = paste0(prefix, "_init_value"),
        max_iter = paste0(prefix, "_max_iter_value"),
        tolerance = paste0(prefix, "_tolerance_value"),
        output_solution = paste0(prefix, "_solution"),
        output_plot = paste0(prefix, "_plot"),
        calculate = paste0(prefix, "_calculate_button"),
        reset = paste0(prefix, "_reset_button"),
        is_secant = is_secant
      )
    
    if (!single_init) {
      temp <-
        list(
          init_value_start = paste0(prefix, "_init_value_start"),
          init_value_end = paste0(prefix, "_init_value_end")
        )
      names <- append(names, temp)
    }
    if (is_secant) {
      temp <-
        list(
          first_title = "First Initial Guess",
          first_placeholder = "Enter first...",
          second_title = "Second Initial Guess",
          second_placeholder = "Enter second..."
        )
      names <- append(names, temp)
    }
    return(names)
  }


create_page <- function(names) {
  fluidPage(
    useShinyjs(),
    create_popup_window(
      names$popup,
      names$popup_plot,
      names$download_plot,
      names$plot_name
    ),
    tags$head(tags$script(HTML(names$logify))),
    tags$head(tags$script(HTML(names$onload))),
    fluidRow(column(
      12,
      create_box_for_html(names$html_id, names$html_path)
    )),
    fluidRow(
      column(
        6,
        create_box_for_function_text(names$func_text_id, names$func_text_height),
        align = "center"
      ),
      if (names$single_init) {
        column(6,
               create_box_for_single_initial_value(names$init_value),
               align = "center")
      } else{
        if (names$is_secant) {
          column(
            6,
            create_box_for_multiple_initial_values(
              names$init_value_start,
              names$init_value_end,
              names$first_title,
              names$first_placeholder,
              names$second_title,
              names$second_placeholder
            ),
            align = "center"
          )
        } else{
          column(
            6,
            create_box_for_multiple_initial_values(names$init_value_start, names$init_value_end),
            align = "center"
          )
        }
        
      }
      
    ),
    fluidRow(
      column(6,
             create_box_for_max_iter(names$max_iter),
             align = "center"),
      column(6,
             create_box_for_tolerance(names$tolerance),
             align = "center")
    ),
    fluidRow(
      column(6,
             uiOutput(names$output_solution),
             align = "center"),
      column(6,
             uiOutput(names$output_plot),
             align = "center")
    ),
    fluidRow(
      column(
        6,
        create_action_button_for_calculation(names$calculate),
        align = "right"
      ),
      column(6,
             create_action_button_for_reset(names$reset),
             align = "left")
    )
  )
}