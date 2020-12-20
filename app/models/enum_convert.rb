class EnumConvert < ApplicationRecord
  belongs_to :enum_from, class_name: "Enum"
  belongs_to :enum_to, class_name: "Enum"
  def self.do_convert(enum_from, enum_system_to_id, value)
    enum_name = enum_from.name
    system_from_id = enum_from.system_id

    # Если используется одна система единиц, возвращаем исходные значения
    if system_from_id == enum_system_to_id
      return value, enum_name, nil
    end
    # Выбираем прямые преобразования
    converts = Array.new
    EnumConvert.where('enum_from_id=? and enum_to_id in (select id from enums where system_id=?)', enum_from.id,enum_system_to_id).each do |u|
      converts.push( {ratio: u.ratio, enum_name: u.enum_to.name } )
    end
    # Добавляем обратные преобразования
    EnumConvert.where('enum_to_id=? and enum_from_id in (select id from enums where system_id=?)', enum_from.id,enum_system_to_id).each do |u|
      converts.push( {ratio: 1.0/u.ratio, enum_name: u.enum_from.name } )
    end

    # Если нет переобразования, возвращаем исходные значения
    if converts.length == 0
      return value, enum_name, nil
    end

    # Ищем приемлемое значение (не слишком маленькое и не слишком большое)
    # Если условие не выполнено, будет выведенно постеднее найденое значение
    v = value
    converts.each do |c|
      v = c[:ratio]*value
      enum_name = c[:enum_name]
      if v > 0.5 and v < 1000
        break
      end
    end

    return v, enum_name, converts
  end
end
