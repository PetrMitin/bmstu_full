class CalcController < ApplicationController
  before_action :assertion, only: [:view]

  def input; end

  def assertion
    n = params[:n].to_i
    m = params[:m].to_i
    if n.zero? || m.zero?
      flash[:alert] = 'You cannot enter zeroes or nil values!, try again'
      redirect_to action: :input
    end
  end

  def get_xml
    @results = Result.all
    hash_array = Array.new

    @results.each do |record|
      hash_string = { "n" => record.n, "m" => record.m, "nok" => record.nok, "nod" => record.nod }
      hash_array.push(hash_string)
    end

    file_path = create_xml_file(hash_array.to_xml)
    send_file file_path, type: 'application/xml', disposition: 'inline'
  end

  def view
    @n = params[:n].to_i
    @m = params[:m].to_i

    is_record_found = false
    db_records = Result.all
    db_records.each do |record|
      if record.n == @n && record.m == @m
        @nod = record.nod
        @nok = record.nok
        is_record_found = true
        puts "found record of n: #{@n} and m: #{@m}, loading from db"
        return
      end
    end

    unless is_record_found
      @nod = calculate
      @nok = (params[:n].to_i * params[:m].to_i) / calculate
      puts "no record found of n: #{@n} and m: #{@m}, calculating and saving to db"
      record_to_save = Result.new(n: @n, m: @m, nod: @nod, nok: @nok)
      record_to_save.save
    end
  end

  def create_xml_file(xml_text)
    file_path = Rails.root.join('public', 'result.xml')
    File.open(file_path, 'w') do |file|
      file.write(xml_text)
    end
    file_path
  end

  private

  def calculate
    n = params[:n].to_i
    m = params[:m].to_i
    n, m = m, n % m while m != 0
    n
  end
end

