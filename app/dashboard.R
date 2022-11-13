sidebar <- dashboardSidebar(sidebarMenu(
  id = "tabs",
  menuItem("Home", tabName = "home", icon = icon("home")),
  menuItem(
    "Root Finding Algorithms",
    tabName = "rootfinding",
    startExpanded = TRUE,
    menuSubItem("Newton", tabName = "newton"),
    menuSubItem("Secant", tabName = "secant"),
    menuSubItem("Bisection", tabName = "bisection"),
    menuSubItem("Fixedpoint", tabName = "fixedpoint")
  )
  
))

body <- dashboardBody(tabItems(
  tabItem(tabName = "home",
          home_page),
  
  tabItem(tabName = "fixedpoint",
          fixed_point_page),
  
  tabItem(tabName = "bisection",
          bisection_page)
))


dashboard <-
  dashboardPage(dashboardHeader(title = "Root Finding Algorithms"),
                sidebar,
                body)

