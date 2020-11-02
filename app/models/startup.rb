class Startup
    attr_accessor :name 
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain =  domain
        @@all << self
    end


    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.select do |startup_inst|
            startup_inst.founder == founder_name
            # binding.pry
        end
    end

    def self.domains
        domains_array = []
        self.all.each do |startup_inst|
            domains_array << startup_inst.domain
        end
        domains_array
    end

   
    def sign_contract(venture_capitalist, type, investment)
        #(startup, venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)

    end

    def num_funding_rounds
        round_count = []
        FundingRound.all.each do |round|
            round_count << round.startup == self
        end.count
        round_count
    end

    def all_rounds 
        FundingRound.all.select do |round|
            round.startup == self
        end
    end


    def num_funding_rounds
        self.all_rounds.count
    end

    def total_funds
        total_investment = self.all_rounds.map do |round|
            round.investment
        end
        total_investment.sum
    end

    def investors
        investors_array =self.all_rounds.map do |round|
            round.venture_capitalist
        end
        investors_array.uniq
    end
       
    def big_investors
        investors.select do |investor|
            VentureCapitalist.tres_commas_club.invlude?(investor)
        end

    end

end
