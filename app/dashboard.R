sidebar <- dashboardSidebar(
  tags$style(HTML(".sidebar-menu li a { font-size: 14px; }")),
  sidebarMenu(
  id = "tabs",
  menuItem("Home", tabName = "home", icon = icon("home")),
  menuItem(
    "Root Finding Algorithms",
    tabName = "rootfinding",
    startExpanded = TRUE,
    menuSubItem("Newton", tabName = "newton"),
    menuSubItem("Secant", tabName = "secant"),
    menuSubItem("Bisection", tabName = "bisection"),
    menuSubItem("Fixedpoint", tabName = "fixedpoint"),
    menuSubItem("Regula Falsi", tabName = "regula"),
    menuSubItem("Halley's Method", tabName = "halley"),
    menuSubItem("Further Information",tabName ="rei")
  )
  
))


body <- dashboardBody(tabItems(
  tabItem(tabName = "home",
          home_page),
  
  tabItem(tabName = "fixedpoint",
          fixed_point_page),
  
  tabItem(tabName = "newton",
          newton_page),
  
  tabItem(tabName = "bisection",
          bisection_page),
  tabItem(tabName = "secant",
          secant_page),
  tabItem(tabName = "regula",
          regula_page),
  tabItem(tabName = "halley", halley_page),
  tabItem(tabName = "rei", rei_page)
))


dashboard <-
  dashboardPage(dashboardHeader(title = "Root Finding Algorithms"),
                sidebar,
                body)

