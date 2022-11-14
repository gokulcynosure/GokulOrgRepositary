public class MatchFetch {
    public static void createMatches() {
        
        String body = '{\"matchDetails\":[{\"matchDetailsMap\":{\"key\":\"Sun,16Oct2022\",\"match\":[{\"matchInfo\":{\"matchId\":42986,\"seriesId\":3961,\"seriesName\":\"ICCMensT20WorldCup2022\",\"matchDesc\":\"1stMatch,GroupA\",\"matchFormat\":\"T20\",\"startDate\":\"1665892800000\",\"endDate\":\"1665905400000\",\"state\":\"Complete\",\"status\":\"Namibiawonby55runs\",\"team1\":{\"teamId\":161,\"teamName\":\"Namibia\",\"teamSName\":\"NAM\",\"imageId\":172229},\"team2\":{\"teamId\":5,\"teamName\":\"SriLanka\",\"teamSName\":\"SL\",\"imageId\":172119},\"venueInfo\":{\"id\":453,\"ground\":\"SimondsStadium\",\"city\":\"Geelong\",\"timezone\":\"+11:00\"},\"currBatTeamId\":161,\"seriesStartDt\":\"1665878400000\",\"seriesEndDt\":\"1668470400000\",\"isTimeAnnounced\":true},\"matchScore\":{\"team1Score\":{\"inngs1\":{\"inningsId\":1,\"runs\":163,\"wickets\":7,\"overs\":19.6}},\"team2Score\":{\"inngs1\":{\"inningsId\":2,\"runs\":108,\"wickets\":10,\"overs\":18.6}}}},{\"matchInfo\":{\"matchId\":42991,\"seriesId\":3961,\"seriesName\":\"ICCMensT20WorldCup2022\",\"matchDesc\":\"2ndMatch,GroupA\",\"matchFormat\":\"T20\",\"startDate\":\"1665907200000\",\"endDate\":\"1665919800000\",\"state\":\"Complete\",\"status\":\"Netherlandswonby3wkts\",\"team1\":{\"teamId\":7,\"teamName\":\"UnitedArabEmirates\",\"teamSName\":\"UAE\",\"imageId\":172121},\"team2\":{\"teamId\":24,\"teamName\":\"Netherlands\",\"teamSName\":\"NED\",\"imageId\":172138},\"venueInfo\":{\"id\":453,\"ground\":\"SimondsStadium\",\"city\":\"Geelong\",\"timezone\":\"+11:00\"},\"currBatTeamId\":24,\"seriesStartDt\":\"1665878400000\",\"seriesEndDt\":\"1668470400000\",\"isTimeAnnounced\":true},\"matchScore\":{\"team1Score\":{\"inngs1\":{\"inningsId\":1,\"runs\":111,\"wickets\":8,\"overs\":19.6}},\"team2Score\":{\"inngs1\":{\"inningsId\":2,\"runs\":112,\"wickets\":7,\"overs\":19.5}}}}]}}]}';
            MatchDetailsClass md = (MatchDetailsClass) JSON.deserialize(body, MatchDetailsClass.class);
        system.debug(md);
        
        List<Match__c> matchObjectList = new List<Match__C>();
        
        for(matchDetailsMapClass m : md.matchDetails ){
            for(matches mat : m.matchDetailsMap.match){
                system.debug('mat'+ mat);
                Match__c matchVariable = new Match__c();
                matchVariable.Match_Id__c = mat.matchInfo.matchId;
                matchVariable.Match_Desc__c = mat.matchInfo.matchDesc;
                matchVariable.Match_Format__c = mat.matchInfo.matchFormat;
                matchVariable.Series_Id__c = mat.matchInfo.seriesId;
                matchVariable.Series_Name__c = mat.matchInfo.seriesName;
                matchVariable.State__c = mat.matchInfo.state;
                matchVariable.Status__c = mat.matchInfo.status;
                
                system.debug(mat.matchInfo.team1);
                matchObjectList.add(matchVariable);
            }
        }
        Insert matchObjectList;
        Integer matchCount = 0;
        List<Team__c> teamList = new List<Team__c>();
        
        for(matchDetailsMapClass m : md.matchDetails ){
            for(matches mat : m.matchDetailsMap.match){
                String accId = matchObjectList.get(matchCount).id; 
                Team__C team1 = new Team__c();
                team1.Team_Id__c = mat.matchInfo.team1.teamId;
                team1.Team_Name__c = mat.matchInfo.team1.teamName;
                team1.Match__c = accId;
                teamList.add(team1);
                
                Team__C team2 = new Team__c();
                team2.Team_Id__c = mat.matchInfo.team2.teamId;
                team2.Team_Name__c = mat.matchInfo.team2.teamName;
                team2.Match__c = accId;
                teamList.add(team2);
                
                matchCount ++;
           }
        }
        Insert teamList;
        system.debug(teamList);
    }
    
    public class MatchDetailsClass {
        List<matchDetailsMapClass> matchDetails;
    }
    public class matchDetailsMapClass{
        ListOfMatches matchDetailsMap;
    }
    public class ListOfmatches{
        public string key;
        public string seriesId;
        List <Matches> match;
    }
    public class matches{
        match matchInfo;
        matchScores matchScore;
    }
    public class match{
        public Integer matchId;
        public Integer seriesId;
        public string seriesName;
        public string matchDesc;
        public string state;
        public string status;
        public string matchFormat;
        Team team1;
        Team team2;
    }
    public class Team{
        public Integer teamId;
        public String teamName;
    }
    public class matchScores{
        TeamScore team1Score;
        TeamScore team2Score;
    }
    public class teamScore{
        innings inngs1;
    }
    public class innings{
        public Integer inningsId;
        public Integer runs;
        public Integer wickets;
        public Decimal overs;
    }
    }