grocerygapatlas <- read.csv("full_tract.csv")
grocerygapatlas_averaged <- grocerygapatlas |>
  # Extract county name from the tract description
  dplyr::mutate(
    county = stringr::str_extract(NAME, "([A-Za-z\\s]+) County")
  ) |>
  # Group by county
  dplyr::group_by(county) |>
  # Calculate averages for all numeric columns
  dplyr::summarise(
    dplyr::across(where(is.numeric), ~ mean(.x, na.rm = TRUE)),
    .groups = "drop"
  )


usda <- readxl::read_excel("FoodAccessResearchAtlasData2019.xlsx")
