stadium <- data.frame(
    Club = c("Arsenal", "Aston Villa", "Bournemouth", "Brighton & Hove Albion", 
             "Burnley", "Chelsea", "Crystal Palace", "Everton", "Leicester City", 
             "Liverpool", "Manchester City", "Manchester United", "Newcastle United", 
             "Norwich City", "Sheffield United", "Southampton", "Tottenham Hotspur", 
             "Watford", "West Ham Umited", "Wolverhampton Wanderers"),
    Name = c("Emirates Stadium", "Villa Park", "Dean Court", "Falmer Stadium", 
             "Turf Moor", "Stamford Bridge", "Selhurst Park", "Goodison Park", 
             "King Power Stadium", "Anfield", "City of Manchester Stadium", 
             "Old Trafford", "St James' Park", "Carrow Road", "Bramall Lane", 
             "St Mary's Stadium", "Tottenham Hotspur Stadium", "Vicarage Road", 
             "London Stadium", "Molineux Stadium"),
    lat = c(51.555, 52.509167, 50.735278, 50.861822, 53.789167, 51.481667, 
             51.398333, 53.438889, 52.620278, 53.430833, 53.483056, 53.463056, 
             54.975556, 52.622222, 53.370278, 50.905833, 51.604722, 51.65, 
             51.538611, 52.590278),
    lng = c(-0.108611, -1.884722, -1.838333, -0.083278, -2.230278, -0.191111, 
             -0.085556, -2.966389, -1.142222, -2.960833, -2.200278, -2.291389, 
             -1.621667, 1.309167, -1.470833, -1.391111, -0.066389, -0.401667, 
             -0.016389, -2.130278),
    Capacity = c(60704, 42095, 11364, 30750, 21944, 40834, 25486, 39414, 32361, 
                 53394, 55017, 75643, 52305, 27359, 32125, 32384, 62214, 22200, 
                 60000, 32050),
    Position = c(8, 17, 18, 15, 10, 4, 14, 12, 5, 1, 2, 3, 13, 20, 9, 11, 6, 19, 
                 16, 7),
    Color = c("orange", "grey", "red", "grey", "grey", "green", "grey", "grey", "orange", "blue", "green", "green", "grey", "red", "grey", "grey", "orange", "red", "grey", "grey")
)

stadium$Status <- ifelse(stadium$Color == "blue","PL Champion and Champions League 2020/21",
    ifelse(stadium$Color == "green", "Champions League 2020/21", 
    ifelse(stadium$Color == "orange", "Europa League 2020/21", 
    ifelse(stadium$Color == "red", "Relegated to Championship", "None"))))


library(leaflet); library(htmltools) #for br()

stadium %>% leaflet() %>% addTiles() %>% 
    addCircleMarkers(fillColor = stadium$Color, color = stadium$Color, opacity = 0.8, 
                     weight = 3, radius = stadium$Capacity/2500, fillOpacity = 0.4, 
                     popup = paste(stadium$Club,":", " ", stadium$Name, br(), "Capacity:", " ", stadium$Capacity, sep = ""),
                     clusterOptions = markerClusterOptions()) %>%
    addLegend(labels = c("PL Champion and Champions League 2020/21", 
                         "Champions League 2020/21", "Europa League 2020/21", "Relegated"), 
            colors = c("blue", "green", "orange", "red"), position = "topright")
              
    
