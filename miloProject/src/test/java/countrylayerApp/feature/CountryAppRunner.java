package countrylayerApp.feature;


import com.intuit.karate.junit5.Karate;



class CountryAppRunner {
    
    @Karate.Test
    Karate testCountryApp() {
        return Karate.run("getCountries").relativeTo(getClass()).tags("Test");
    }    

}
