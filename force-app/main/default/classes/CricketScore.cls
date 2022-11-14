public class CricketScore {

    public static void printCricketScore() {
         
        String body = '{"inningsId":1,"batsmanStriker":{"batBalls":6,"batDots":4,"batFours":0,"batId":576,"batName":"Rohit Sharma","batMins":12,"batRuns":7,"batSixes":1,"batStrikeRate":116.67},"batsmanNonStriker":{"batBalls":2,"batDots":0,"batFours":0,"batId":1413,"batName":"Virat Kohli","batMins":0,"batRuns":2,"batSixes":0,"batStrikeRate":100},"batTeam":{"teamId":2,"teamScore":19,"teamWkts":1},"bowlerStriker":{"bowlId":13273,"bowlName":"Bas de Leede","bowlMaidens":0,"bowlNoballs":0,"bowlOvs":0.2,"bowlRuns":1,"bowlWides":0,"bowlWkts":0,"bowlEcon":3},"bowlerNonStriker":{"bowlId":9357,"bowlName":"Paul van Meekeren","bowlMaidens":0,"bowlNoballs":0,"bowlOvs":1,"bowlRuns":9,"bowlWides":0,"bowlWkts":1,"bowlEcon":9},"overs":3.2,"recentOvsStats":"... 0 1 0 0  | 2 0 0 W 1 6  | 1 0","partnerShip":{"balls":4,"runs":8},"currentRunRate":5.7,"requiredRunRate":0,"lastWicket":"KL Rahul  lbw b van Meekeren 9(12)  - 11/1 in 2.4 ov.","matchScoreDetails":{"matchId":43096,"inningsScoreList":[{"inningsId":1,"batTeamId":2,"batTeamName":"IND","score":19,"wickets":1,"overs":3.2,"isDeclared":false,"isFollowOn":false,"ballNbr":20}],"tossResults":{"tossWinnerId":2,"tossWinnerName":"India","decision":"Batting"},"matchTeamInfo":[{"battingTeamId":2,"battingTeamShortName":"IND","bowlingTeamId":24,"bowlingTeamShortName":"NED"}],"isMatchNotCovered":false,"matchFormat":"T20","state":"In Progress","customStatus":"India opt to bat","highlightedTeamId":2},"latestPerformance":[{"runs":18,"wkts":1,"label":"Last 3 overs"}],"ppData":{"pp_1":{"ppId":78,"ppOversFrom":0.1,"ppOversTo":6,"ppType":"mandatory","runsScored":19}},"overSummaryList":[{"score":19,"wickets":1,"inningsId":1,"o_summary":"1 0 ","runs":1,"batStrikerIds":[576,1413],"batStrikerNames":["Rohit","Kohli"],"batStrikerRuns":7,"batStrikerBalls":6,"batNonStrikerIds":[],"batNonStrikerNames":[],"batNonStrikerRuns":2,"batNonStrikerBalls":2,"bowlIds":[13273],"bowlNames":["Bas de Leede"],"bowlOvers":0.2,"bowlMaidens":0,"bowlRuns":1,"bowlWickets":0,"timestamp":1666855575297,"overNum":3.2,"batTeamName":"IND","event":"over-break"},{"score":18,"wickets":1,"inningsId":1,"o_summary":"2 0 0 W 1 6 ","runs":9,"batStrikerIds":[576,1413,8733],"batStrikerNames":["Rohit","Kohli","Rahul"],"batStrikerRuns":7,"batStrikerBalls":5,"batNonStrikerIds":[],"batNonStrikerNames":[],"batNonStrikerRuns":1,"batNonStrikerBalls":1,"bowlIds":[9357],"bowlNames":["Paul van Meekeren"],"bowlOvers":1,"bowlMaidens":0,"bowlRuns":9,"bowlWickets":1,"timestamp":1666855461990,"overNum":2.6,"batTeamName":"IND","event":"over-break"},{"score":9,"wickets":0,"inningsId":1,"o_summary":"0 1 0 1 0 0 ","runs":2,"batStrikerIds":[576,8733],"batStrikerNames":["Rohit","Rahul"],"batStrikerRuns":1,"batStrikerBalls":4,"batNonStrikerIds":[],"batNonStrikerNames":[],"batNonStrikerRuns":7,"batNonStrikerBalls":8,"bowlIds":[15205],"bowlNames":["Tim Pringle"],"bowlOvers":1,"bowlMaidens":0,"bowlRuns":2,"bowlWickets":0,"timestamp":1666855152144,"overNum":1.6,"batTeamName":"IND","event":"over-break"},{"score":7,"wickets":0,"inningsId":1,"o_summary":"0 Wd 0 4 2 0 0 ","runs":7,"batStrikerIds":[8733],"batStrikerNames":["Rahul"],"batStrikerRuns":6,"batStrikerBalls":6,"batNonStrikerIds":[576],"batNonStrikerNames":["Rohit"],"batNonStrikerRuns":0,"batNonStrikerBalls":0,"bowlIds":[12783],"bowlNames":["Fred Klaassen"],"bowlOvers":1,"bowlMaidens":0,"bowlRuns":7,"bowlWickets":0,"timestamp":1666854964980,"overNum":0.6,"batTeamName":"IND","event":"over-break"}],"status":"India opt to bat","lastWicketScore":9,"remRunsToWin":0,"matchHeader":{"matchId":43096,"matchDescription":"23rd Match, Super 12 Group 2","matchFormat":"T20","matchType":"International","complete":false,"domestic":false,"matchStartTimestamp":1666854000000,"matchCompleteTimestamp":1666864800000,"dayNight":false,"year":2022,"state":"In Progress","status":"India opt to bat","tossResults":{"tossWinnerId":2,"tossWinnerName":"India","decision":"Batting"},"result":{"winningTeam":"","winByRuns":false,"winByInnings":false},"revisedTarget":{"reason":""},"playersOfTheMatch":[],"playersOfTheSeries":[],"matchTeamInfo":[{"battingTeamId":2,"battingTeamShortName":"IND","bowlingTeamId":24,"bowlingTeamShortName":"NED"}],"isMatchNotCovered":false,"team1":{"id":2,"name":"India","playerDetails":[],"shortName":"IND"},"team2":{"id":24,"name":"Netherlands","playerDetails":[],"shortName":"NED"},"seriesDesc":"ICC Mens T20 World Cup 2022","seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022"},"responseLastUpdated":1666855579}';
        MainClass md = (MainClass) JSON.deserialize(body, MainClass.class);
        system.debug('md'+ md);
        
        String batingTeamName;
        String Score;
        String wickets;
        String Overs;
        String vs = 'vs';
        string bowlTeamName;
        
        Map<String,Decimal> players = new Map<String,Decimal>();
        
        
        for(InningsScore  is: md.matchScoreDetails.inningsScoreList){
            batingTeamName = ' ' + is.batTeamName; 
            Score =  ' ' + is.score.format();
            wickets = '' + '/'+ is.wickets.format();
            Overs = '  ' + is.overs.format() + '  overs';
       }
        for(matchTeamInfos m : md.matchScoreDetails.matchTeamInfo){
            bowlTeamName = m.bowlingTeamShortName;
        }
      
        String strikerName = md.batsmanStriker.batName;
        Decimal strikerRuns = md.batsmanStriker.batRuns;
        
        String nonStrikerName = md.batsmanNonStriker.batName;
        Decimal nonStrikerRuns = md.batsmanNonStriker.batRuns;
        
        players.put(strikerName + '*',strikerRuns);
        players.put(nonStrikerName,nonStrikerRuns);
        

       
        
        String a = batingTeamName + Score + wickets + Overs;
        system.debug(a + ' ' + players + ' ' + vs + ' ' + bowlTeamName );
    }
    
    public class MainClass{
        public masterScoreClass matchScoreDetails;
        public striker batsmanStriker;
        public nonStriker batsmanNonStriker;
    }
    
    public class masterScoreClass{
       public List<InningsScore> inningsScoreList;
        public List<matchTeamInfos> matchTeamInfo;
    }
    public class InningsScore{
        public string batTeamName;
        public Integer score;
        public Integer wickets;
        public Decimal overs;
    }
    public class striker{
        public string batName;
        public Decimal batRuns;
    }
    public class nonStriker{
        public string batName;
        public Decimal batRuns;
    }
    public class matchTeamInfos{
     public string battingTeamShortName;
     public string bowlingTeamShortName;
    }
  
    
    
}