class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    def self.find_by_ticker(ticker_symbol)
        where(ticket: ticker_symbol).first
    end

    def self.new_from_lookup(ticker_symbol)
        begin
            client = IEX::Api::Client.new(publishable_token: 'pk_c2f7cd6d4ac14caf9b667778655070b8')
            looked_up_stock = client.quote(ticker_symbol)
            new(name: looked_up_stock.company_name,
                ticket: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
        rescue Exception => e
            return nil
        end
    end
end