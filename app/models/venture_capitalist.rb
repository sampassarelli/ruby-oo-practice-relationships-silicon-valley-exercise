class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        billionaires = []
        self.all.each do |capitalist_inst|
            if capitalist_inst.total_worth >= 1000000000
                billionaires << capitalist_inst.name
            end
        end
        billionaires
    end

    def offer_contract (startup, type, investment)
       #(startup, venture_capitalist, type, investment) 
       FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        portfolio_array = self.funding_rounds.map do |round|
            round.startup
        end  
        portfolio_array.uniq  
    end

    def biggest_investment
        investment_array = self.funding_rounds.map do |round|
            round.investment
        end
        investment_array.max    
    end

    def invested(domain)
        domain_array = self.funding_rounds.select do |investment|
            investment.startup.domain == domain      
        end
        investments = domain_array.map do |funds|
            funds.investment
        end
        investments.sum
    end 

end
