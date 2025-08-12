library( tidyverse )

x <- "42"

iris |> 
  filter( Species == "setosa" ) |> 
  select( Sepal.Length, 
          Sepal.Width ) |>
  summarise( Width = mean( Sepal.Width),
             Length = mean( Sepal.Length) )



iris |>
  group_by( Species ) |> 
  summarise( Mean = mean( Sepal.Length),
             Variance = var( Sepal.Length ) ) 


iris |> 
  ggplot( aes( x = Sepal.Length, 
               y = Sepal.Width, 
               color = Species) ) + 
  geom_point() 
  


iris |> 
  ggplot() + 
  geom_point( aes( x = Sepal.Length, 
                   y = Sepal.Width, 
                   color = Species) ) 


iris |> 
  ggplot( aes( x = Sepal.Length, 
               y = Sepal.Width, 
               color = Species) ) + 
  geom_point() +
  theme_minimal() + 
  xlab("Sepal Lenght")


iris |> 
  select( Sepal.Length) |> 
  as.vector() |> 
  hist() 


iris |>
  ggplot( aes(Sepal.Length ) ) + 
  geom_density( fill="blue") + 
  theme_minimal() +
  xlab( "Sepal Length (mm)")






  





       

     
  

