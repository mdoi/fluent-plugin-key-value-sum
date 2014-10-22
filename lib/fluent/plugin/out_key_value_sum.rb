module Fluent
  class KeyValueSum < Fluent::BufferedOutput
    Fluent::Plugin.register_output('key_value_sum', self)

    unless method_defined?(:log)
      define_method('log') { $log }
    end

    config_param :tag, :string, :default => "kvs"
    config_param :key, :string, :default => "key"
    config_param :value, :string, :default => "value"

    def initialize
      super
    end

    def configure(conf)
      super
    end

    def format(tag, time, record)
      [tag, time, record].to_msgpack
    end

    def write(chunk)
      stats = {}
      chunk.msgpack_each do |tag, time, record|
        next unless record[@key]
        next unless record[@value]
        count(stats, record)
      end

      output_stats(stats)
    end

    private
    def count(stats, record)
      unless stats[record[@key]]
        stats[record[@key]] = record
      end

      stats[record[@key]][@value] += record[@key][@value].to_i
    end

    def output_stats(stats)
      stats.each do |k, v|
        Fluent::Engine.emit("#{@tag}", Fluent::Engine.now, v)
      end
    end
  end
end
