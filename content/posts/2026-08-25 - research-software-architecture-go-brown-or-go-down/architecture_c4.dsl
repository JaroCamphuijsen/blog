workspace "Name" "Description" {

    !identifiers hierarchical

    model {
        usa = person "School Admin"
        ur = person "Researcher"
        us = person "Student"
        um = person "Mentor"
        
        pds = softwareSystem "Participant Data System" {
            sp = container "School Portal" {
                tags "WebBrowser"
            }
            rp = container "Researcher Portal" {
                tags "WebBrowser"
            }
            
            lids = container "LongID Service"
            vs = container "Vault Service"
            
            liddb = container "LongID Database" {
                tags "Database"
            }
            
            vdb = container "Vault Database" {
                tags "Database"
            }
            
            vsrapi = container "Vault-Survey REST API"
        }


        sas = softwareSystem "Survey System" {
            lsc = container "LimeSurvey Client" {
                tags "WebBrowser"
            }
            lsa = container "LimeSurvey Admin" {
                tags "WebBrowser"
            }
            ss = container "Survey Server"
            sdb = container "Survey Database" {
                tags "Database"
            }
        }

        das = softwareSystem "Data Analysis System" {
            rg = container "Report Generator"
            ra = container "Response Archiver"
            da = container "Data Archive" {
                tags "Folder"
            }
            sa = container "Scientific Analysis"
        }

        
        usa -> pds.sp "Provides participant data to"
        ur -> pds.rp "Provides Survey Plan input to"
        us -> sas.lsc "Fills out survey using"
        um -> sas.lsc "Fills out survey using"
        
        ur -> sas.lsa "Creates questionnaire and exports responses using"
        
        sas.lsa -> das.ra "Sends responses to"
        ur -> das.rg "Creates report with"
        
        pds.sp -> pds.vs "Sends curated participant data and receives survey execution data from"
        pds.vs -> pds.vdb "Reads and writes vault data"
        pds.vs -> pds.lids "Requests longID lookup from"
        pds.lids -> pds.liddb "Reads and writes longID to"
        pds.rp -> pds.vs "Sends Survey Plan to"
        pds.vsrapi -> pds.vdb "Reads vault data from"
        
        sas.lsc -> pds.vsrapi "Authenticates and requests group members from"
        sas.ss -> pds.vsrapi "Requests participant attributes and consent"
        sas.lsc -> sas.ss "Requests questions and sends responses"
        sas.ss -> sas.sdb "Reads and writes to"
        sas.lsa -> sas.ss "Sends questionnaire to and receives responses from"
        
        das.ra -> das.da "Archives responses in"
        das.rg -> das.da "Archives report in"
        das.sa -> ur "Receives results from"
        das.sa -> das.da "Fetches data from"
        
        
        
    }

    views {
    
        systemLandscape {
            include *
        }

        container pds {
            include *
        }
        
        container sas {
            include *
        }
        
        container das {
            include *
        }

        styles {
            element "WebBrowser" {
                shape webbrowser
                color #380339
                stroke #380339
                strokeWidth 7
            }
            element "Folder" {
                color #380339
                stroke #380339
                strokeWidth 7
                shape folder
            }
            element "Container" {
                color #380339
                stroke #380339
                strokeWidth 7
                shape roundedbox
            }
            element "Software System" {
                color #009DDD
                stroke #009DDD
                strokeWidth 5
                shape box
            }
            element "Person" {
                color #FFB213
                stroke #FFB213
                strokeWidth 7
                shape person
            }
            element "Database" {
                color #380339
                stroke #380339
                strokeWidth 7
                shape cylinder
            }
            element "Boundary" {
                color #009DDD
                stroke #009DDD
                strokeWidth 5
            }
            relationship "Relationship" {
                thickness 4
            }
        }
    }

    configuration {
        scope landscape
    }

}
