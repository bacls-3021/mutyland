class Product < ApplicationRecord
  has_many :product_images, inverse_of: :product
  accepts_nested_attributes_for :product_images
  before_validation :generate_account, on: :create
  before_create :change_description

  def specific_type_product template
    case template
    when 'rongbay'
      case type_product
      when 'Nhà trong hẻm'
        'Nhà riêng'
      when 'Nhà mặt tiền'
        'Nhà mặt phố'
      when 'Căn hộ chung cư'
        'Căn hộ chung cư'
      when 'Biệt thự, nhà liền kề'
        'Biệt thự/Liền kề /Đất nền'
      when 'Đất thổ cư, đất ở'
        'Đất ở/ Đất thổ cư'
      end
    when 'batdongsan'
      case type_product
      when 'Nhà trong hẻm'
        'Nhà riêng'
      when 'Nhà mặt tiền'
        'Nhà mặt phố'
      when 'Căn hộ chung cư'
        'Căn hộ chung cư'
      when 'Biệt thự, nhà liền kề'
        'Luxury home'
      when 'Đất thổ cư, đất ở'
        'Đất'
      end
    when 'tinbds'
      case type_product
      when 'Nhà trong hẻm'
        'nhà riêng'
      when 'Nhà mặt tiền'
        'nhà mặt phố'
      when 'Căn hộ chung cư'
        'căn hộ chung cư'
      when 'Biệt thự, nhà liền kề'
        'nhà biệt thự, liền kề'
      when 'Đất thổ cư, đất ở'
        'Bán đất'
      end
    when 'nhadatvui'
      case type_product
      when 'Nhà trong hẻm'
        'Nhà riêng'
      when 'Nhà mặt tiền'
        'Nhà riêng'
      when 'Căn hộ chung cư'
        'Căn hộ'
      when 'Biệt thự, nhà liền kề'
        'Biệt thự'
      when 'Đất thổ cư, đất ở'
        'Đất'
      end
    when 'bannhadat123'
      case type_product
      when 'Nhà trong hẻm'
        'Nhà'
      when 'Nhà mặt tiền'
        'Nhà'
      when 'Biệt thự, nhà liền kề'
        'Nhà'
      when 'Căn hộ chung cư'
        'Căn hộ chung cư'
      when 'Đất thổ cư, đất ở'
        'Đất'
      end
    when 'batdongsan24h'
      case type_product
      when 'Nhà trong hẻm'
        'nhà'
      when 'Nhà mặt tiền'
        'nhà mặt phố'
      when 'Biệt thự, nhà liền kề'
        'biệt thự, villas'
      when 'Căn hộ chung cư'
        'căn hộ chung cư'
      when 'Đất thổ cư, đất ở'
        'đất'
      end
    when 'nhadatmatpho'
      case type_product
      when 'Nhà trong hẻm'
        'nhà đất trong ngõ'
      when 'Nhà mặt tiền'
        'nhà đất mặt phố'
      when 'Biệt thự, nhà liền kề'
        'nhà đất biệt thự'
      when 'Căn hộ chung cư'
        'căn hộ chung cư'
      when 'Đất thổ cư, đất ở'
        'nhà đất nền'
      end
    end
  end

  def sub_specific_type_product template
    case template
    when 'bannhadat123'
      case type_product
      when 'Nhà trong hẻm'
        'Nhà hẻm'
      when 'Nhà mặt tiền'
        'Nhà mặt tiền'
      when 'Căn hộ chung cư'
        ''
      when 'Biệt thự, nhà liền kề'
        'Nhà biệt thự'
      when 'Đất thổ cư, đất ở'
        'Đất thổ cư'
      end
    end
  end

  def specific_province template
    case template
    when 'rongbay'
      case province
      when 'Hồ Chí Minh'
        'HCM'
      else
        province
      end
    else
      province
    end
  end

  def full_address
    "#{town}, #{district}, #{province}"
  end

  def base_description
    description.gsub( '<br/>', '\r\n')
  end

  def email_fake
    "#{account}@gmail.com"
  end

  private

  def generate_account
    default_length = 2
    until self.account = unique_account?(default_length)
      default_length += 1
    end
  end

  def unique_account? default_length
    account = "mutyland#{SecureRandom.hex.slice(0, default_length)}"

    Product.exists?(account: account) ?  false : account
  end

  def change_description
    self.description = self.description.gsub("\r\n", '<br/>')
  end
end

# 'Nhà mặt tiền', 'Nhà trong hẻm', 'Biệt thự, nhà liền kề', 'Căn hộ chung cư', 'Phòng trọ, nhà trọ', 'Văn phòng', 'Kho, xưởng', 'Nhà hàng, khách sạn', 'Shop, kiot, quán', 'Trang trại', 'Mặt bằng', 'Đất thổ cư, đất ở', 'Đất nền, liền kề, đất dự án', 'Đất nông, lâm nghiệp', 'Các loại khác
