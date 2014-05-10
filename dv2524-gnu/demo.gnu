# demo.gnu
# Demo plot using GNUplot.
# Requires GNUplot 4.6 or later.
# ---
# Arguments:
# 1. Data set 1 filename 	: arg_data1
# 2. Data set 2 filename 	: arg_data2
# 3. Data set 3 filename 	: arg_data3
# 4. Output filename 		: arg_output
# ---
# Invoke accordingly:
# gnuplot -e "arg_data1='results/paraphong1448x1448.ms';arg_data2='results/paraphong2048x2048.ms';arg_data3='results/paraphong2896x2896.ms';arg_output='out.svg'" demo.nu
# ---
# TODO:
# * Should recieve argument specifying output.

min(p_x, p_y) = (p_x<p_y) ? p_x : p_y
max(p_x, p_y) = (p_x>p_y) ? p_x : p_y
usage(p_iam) = sprintf("%s: Usage: gnuplot -e \"arg_data1='filename1';arg_data2='filename2';arg_data3='filename3';arg_output='filename4'\" demo.nu", p_iam)
press(p_iam) = sprintf("%s: Press any key to continue.", p_iam)

# Entry point:
reset
iam = "dv2524-gpt/demo.gpt"
print sprintf("%s: Enter...", iam)

if(!exists("arg_output")) { # Optional arguments.
	arg_output = "default.svg"
}
if(!exists("arg_data1") || !exists("arg_data2") || !exists("arg_data3")) { # Mandatory arguments.
	print usage(iam)
	pause -1 press(iam) # We should abort script here rather than simply pause it.
}

set terminal svg # Should be customizable.
set output arg_output

print "Julia225 stats:"
stats arg_data1 name "Julia225"
print "Julia450 stats:"
stats arg_data2 name "Julia450"
print "Julia900 stats:"
stats arg_data3 name "Julia900"

julia225Mean=Julia225_mean_y
julia225Min=julia225Mean-Julia225_stddev_y
julia225Max=julia225Mean+Julia225_stddev_y

julia450Mean=Julia450_mean_y
julia450Min=julia450Mean-Julia450_stddev_y
julia450Max=julia450Mean+Julia450_stddev_y

julia900Mean=Julia900_mean_y
julia900Min=julia900Mean-Julia900_stddev_y
julia900Max=julia900Mean+Julia900_stddev_y

juliaMin = min(julia225Min, julia450Min)
juliaMin = min(juliaMin, julia900Min)

juliaMax = max(julia225Max, julia450Max)
juliaMax = max(juliaMax, julia900Max)

set yrange[juliaMin:juliaMax]

plot arg_data1, arg_data2, arg_data3

print sprintf("%s: Exit.", iam)

# ---

# STATS Attributes:
# STATS_min               # minimum value of in-range data points
# STATS_max               # maximum value of in-range data points
# STATS_index_min         # index i for which data[i] == STATS_min
# STATS_index_max         # index i for which data[i] == STATS_max
# STATS_lo_quartile       # value of the lower (1st) quartile boundary
# STATS_median            # median value
# STATS_up_quartile       # value of the upper (3rd) quartile boundary
# STATS_mean              # mean value of in-range data points
# STATS_stddev            # standard deviation of the in-range data points
# STATS_sum               # sum
# STATS_sumsq             # sum of squares

# Goodie-bag:
# Use "show variables all" if you get a bunch of undefined variable errors.