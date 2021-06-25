class Startup

    attr_reader :founder, :domain
    attr_accessor :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self

    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end
    
    def self.find_by_founder(founder_name)
        self.all.select{
            |startup| startup.founder.name == founder_name
        }[0]
    end

    def self.domains
        self.all.map{
            |startup| startup.domain
        }
    end

    def sign_contract(vc, type_inv, amount)
        FundingRound.new(self,vc, type_inv, amount )
    end

    def num_funding_rounds
        FundingRound.all.select{
            |fr| fr.startup == self
        }.size

    end

    def total_funds
        sum = 0
        FundingRound.all.select{
            |fr| fr.startup == self
        }.each { |a| sum+=a.investment }
        sum
    end

    def investors
        FundingRound.all.select{
            |fr| fr.startup == self
        }.map{
            |fr| fr.venture_capitalist
        }.uniq
    end

    def big_investors
        self.investors.select{
            |vc| vc.total_worth >= 1000000000
        }
    end

end
