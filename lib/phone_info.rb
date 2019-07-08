require "phone_info/version"

module PhoneInfo
  extend self

  class Error < StandardError; end

  DATA = File.read(File.expand_path("../../data/phone.dat", __FILE__), mode: "rb")
  DATA_VERSION = DATA[0..3]
  FIRST_INDEX_OFFSET = DATA[4..7].unpack('l').first

  def lookup(number)
    prefix = get_prefix(number)
    first_7digits, record_offset, type = binary_search(prefix)

    if type
      isp = case type.to_i
            when 1 then '移动'
            when 2 then '联通'
            when 3 then '电信'
            when 4 then '电信虚拟运营商'
            when 5 then '联通虚拟运营商'
            when 6 then '移动虚拟运营商'
            else '未知运营商'
            end
      record_at_offset(record_offset).merge(isp: isp, prefix: first_7digits)
    else
      {province: "", city: "", postal_code: "", region_code: "", isp: "", prefix: prefix}
    end
  end

  private
    def get_prefix(number)
      number = number.to_s
      number = number[4..-1] if number =~ /\+86-/
      number[0...7].to_i
    end

    def record_at_offset(offset)
      string = DATA[offset..-1].unpack('Z*').first.force_encoding('utf-8')
      province, city, postal_code, region_code = string.split('|')
      {province: province, city: city, postal_code: postal_code, region_code: region_code}
    end

    def binary_search(prefix, from=0, to=nil)
      to = ((DATA.size - FIRST_INDEX_OFFSET) / 9).to_i if to.nil?
      return [prefix, nil, nil] if from > to

      mid = (from + to) / 2
      index_offset = mid * 9 + FIRST_INDEX_OFFSET
      first_7digits, record_offset, type = DATA[index_offset, index_offset+9].unpack('l2c')
      return [prefix, nil, nil] if first_7digits.nil?

      if prefix < first_7digits
        binary_search(prefix, from, mid - 1)
      elsif prefix > first_7digits
        binary_search(prefix, mid + 1, to)
      else
        [first_7digits, record_offset, type]
      end
    end
end
