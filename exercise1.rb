require 'benchmark'

n = 100000
a = 'a'
b = 'b'


Benchmark.bm do |x|
	x.report { n.times do; a+b; end }
	x.report { n.times do; a<<b ; end }
	x.report { n.times do; "#{a}#{b}" ; end }
	x.report { n.times do; a.concat(b) ; end }
end

# user     system      total        real
#    0.030000   0.000000   0.030000 (  0.027672)
#    0.020000   0.000000   0.020000 (  0.019838)
#    9.300000   3.330000  12.630000 ( 12.711087)
#    0.020000   0.000000   0.020000 (  0.023901)



Benchmark.bm do |x|
	x.report {n.times do ; 1/3.0; end}
	x.report {n.times do ; 1.fdiv(3.0); end}
	x.report {n.times do ; 1/3.to_f; end}
end


# user     system      total        real
# 0.020000   0.000000   0.020000 (  0.023520)
# 0.020000   0.000000   0.020000 (  0.020084)
# 0.040000   0.000000   0.040000 (  0.032255)



Benchmark.bm do |x|
	x.report { n.times do; [1]+[2]; end}
	x.report {n.times do; [1] << 2; end}
	x.report {n.times do; [1].concat([2]); end}
end


# user     system      total        real
# 0.040000   0.000000   0.040000 (  0.044052)
# 0.020000   0.000000   0.020000 (  0.020881)
# 0.040000   0.000000   0.040000 (  0.039421)
