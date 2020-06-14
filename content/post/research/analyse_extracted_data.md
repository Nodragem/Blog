+++
title = "Data extraction with WebPlotDigitizer"
highlight = true
math = true
description = " "
image = ""
post_type = ["research"]
highlight_languages = ["r"]
see_more_link = "/post/"
date = "2017-04-14T12:43:08+01:00"
thumbnail = "webplotdigitizer.gif"
[header]
image = ""
caption = ""
+++


When we've only got a picture to create a model
-------------------------------------

Recently, I wanted to generate realistic
durations of fast eye movements (saccades) in a stochastic manner. 

Few articles plot what we call "the main sequence" which describes the saccade
duration against saccade magnitude (i.e. amplitude), such as in
Troncoso et al. (2008):

<img src="/Blog/img/research/analyseExtractedData_files/figure-markdown/main_sequence.png" width="500px" height="500px"/>

<p style="font-size:0.6rem;"><i>Data from Troncoso, X. G., Macknik, S. L., & Martinez-Conde, S. (2008).
Microsaccades counteract perceptual filling-in. Journal of Vision,
8(14):15, 1-9</i> [ARVO is the copyright holder]</p>

There are 3 main problems though:

1.  we don't have access to the original data used to generate this plot,

1.  there is many data points and the picture quality is quite poor,
    
2.  the plot is in logscale, so it might be hard to get an eyeball
    estimation of the regression line.

Without at least an estimation of the data points, we cannot build a realistic model.

Using a Data Extractor
-------------------------------------

WebPlotDigitizer ([here](http://arohatgi.info/WebPlotDigitizer/)) is a
data extractor that, among other things, allows us to calibrate the axis
of the figure to extract in logspace. I tried it on Troncoso et al.'s
figure, without real hope of obtaining something decent because of the
jped compression (my real hope was to manually draw a regression line in
that jpeg fog).

Here are the steps, recorded with ScreenToGif.

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/webplotdigitizer.gif)

The result is quite impressive when considering the picture quality.
Here is what I obtained with the automatic extraction! Let see how this
looks like once exported in CSV and plotted in R.

We show the first lines of the file:
```R
df1 <- read.csv("extraction1.csv", header = FALSE) 
setnames(df1, c('amplitude', 'duration'))
head(df1, 5)
```

    ##    amplitude duration
    ## 1 0.07355096 6.124430
    ## 2 0.08775247 5.467178
    ## 3 0.08825364 6.549086
    ## 4 0.08875767 5.453267
    ## 5 0.08901076 6.557844

We print the number of data points that have been extracted:
```R
dim(df1)
```

    ## [1] 5725    2

We plot the data:
```R
plot(df1$amplitude, df1$duration, xlim=c(0.01, 2), ylim=c(1, 30),
     main='df1', pch='.' , log="xy")
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-1-1.png)

That looks quite impressive for a data extraction made on a blurry jpeg!

WebPlotDigitizer is not extracting "real" data points (which are almost
invisible on the orginal figure), but still the density of the data points
seems to correctly estimates the density of the original data. This
should be enough to compute a good estimate of the regression line of
the mean duration and of its standard deviation. So now, let us try to
compute these regression lines and make a saccade duration generator.

Compute the Regression model
----------------------------

We should start with finding the regression line in logspace.

```R
df1$log_duration <- log(df1$duration)
df1$log_amplitude <- log(df1$amplitude)
log.model <- lm( log_duration ~ log_amplitude, data=df1)
new <- data.frame(log_amplitude = seq(min(df1$log_amplitude), max(df1$log_amplitude), 0.01))
y_values <- predict(log.model, new, interval="predict")
plot(df1$log_amplitude, df1$log_duration,
     main='df1', pch='.')
lines(new$log_amplitude, y_values[,1], lwd=2, col='red')
lines(new$log_amplitude, y_values[,2], lwd=2, col='red')
lines(new$log_amplitude, y_values[,3], lwd=2, col='red')
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-2-1.png)

In the linear space, we get this pretty curve and increasing standard
deviation.

```R
plot(df1$amplitude, df1$duration,
     main='df1', pch='.')
lines(exp(new$log_amplitude), exp(y_values[,1]), lwd=2, col='red')
lines(exp(new$log_amplitude), exp(y_values[,2]), lwd=2, col='red')
lines(exp(new$log_amplitude), exp(y_values[,3]), lwd=2, col='red')
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-3-1.png)

Extract the equations
---------------------

To be able to generate data from the regression, we must extract the
equations that describes :

-   the mean duration of saccades according to their amplitude,
-   the standard deviation according to their amplitude.

That is a bit more complicated as usual because of the logspace, but it
is feasible.

### Estimate the equation of the mean

It is easy to get the coefficients from the regression line.

```R
b = log.model$coefficients[[1]]
a = log.model$coefficients[[2]]

x = new$log_amplitude
reg_eq = a
y = a*x + b

plot(df1$log_amplitude, df1$log_duration,
     main='df1', pch='.')
lines(x, y, lwd=2, col='red')
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-4-1.png)

Let pass the regression line in linear space. We got: 

$$
y\_{ \text{log} } = a x\_{ \text{log} } + b
$$

and:

$$
y\_{lin} = exp(y\_{log}) \\\\\\
x\_{lin} = exp(x\_{log})
$$

So that, when combined, that gives: 

$$
y\_{lin} = exp(ax\_{log} + b) = exp(ax\_{log}) * exp(b) \\\\\\
        = exp(x\_{log})^a . exp(b) \\\\\\
        = x\_{lin}^a . exp(b)
$$

With we should be able to plot the regression line in linear space:

``` R
cart_x = seq(min(df1$amplitude), max(df1$amplitude), 0.01)
cart_y = (cart_x^a) * exp(b)
plot(df1$amplitude, df1$duration,
     main='df1', pch='.')
lines(cart_x, cart_y, lwd=2, col='red')
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-5-1.png)

Yeah! we got it. Now let us extract the equation for the standard
deviation.

### Estimate the standard deviations

In logarithmic space, we get a standard deviation (SD) that is rather flat, althought
there may be a small irregularity on the right hand side.

``` R
par(mfrow=c(1,2))

log_sd = abs(log.model$residuals)
plot(df1$amplitude, log_sd, ylim=c(-1, 1), xlim=c(0, 1))

sd_change = rollapply(log_sd, width = 200, FUN = median, fill = NA)
plot(df1$amplitude, sd_change, ylim= c(-1, 1 ), xlim=c(0, 1))
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-6-1.png)

Unfortunately, to find the change in variance in the cartesian space is
not as simple as taking the exponential of the logspace's variance.

First, let us compute the standard deviation and its trends in the
cartesian space.

``` R
# remember that:
# cart_x = seq(min(df1$amplitude), max(df1$amplitude), 0.01)
# cart_y = (cart_x^a) * exp(b)

cart_sd = abs(df1$duration - (df1$amplitude^a)*exp(b))

par(mfrow=c(1,2))
plot(df1$amplitude, cart_sd, xlim=c(0, 1))

# moving windows that take the median of the duration's sd over saccade amplitude
sd_change <- rollapply(cart_sd, width = 200, FUN = median, fill = NA)
plot(df1$amplitude, sd_change, xlim=c(0, 1))
df1$sd_duration <- sd_change

# regression of the duration sd over amplitude
var.model <- lm(sd_duration ~ amplitude, data = df1)
curve_y <- predict(var.model, data.frame(amplitude=cart_x) )
lines(cart_x, curve_y, lwd=2, col=2)
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-7-1.png)

``` R
sd_b <- var.model$coefficients[[1]]
sd_a <- var.model$coefficients[[2]]
var.model$coefficients
```

    ## (Intercept)   amplitude 
    ##   0.5487717   3.5581414

From the previous plot, it seems that a linear increase of SD with
amplitude is a good approximation. However, we may not want the SD to
diverge too much. Let us try with a model of variance that have a
horizontal asymptote, for instance `1-exp(-amplitude)`.

``` R
df1$exp_amplitude <- (1-exp(-df1$amplitude))
var.model <- lm(sd_duration ~ exp_amplitude, data = df1)

var.model$coefficients
```

    ##   (Intercept) exp_amplitude 
    ##      0.285162      5.240037

``` R
sd_eb <- var.model$coefficients[[1]]
sd_ea <- var.model$coefficients[[2]]

# we do the prediction ourselve:
# we used SD.Duration = a * [1-exp(-amplitude)] + b, which gives:
curve_y <- (sd_ea + sd_eb) - sd_ea*exp(-cart_x)

plot(df1$amplitude, sd_change, xlim=c(0, 1))
lines(cart_x, curve_y, lwd=2, col=2)
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-8-1.png)

The asymptotic equation seems to approximate the SD as well as the linear
equation.

To judge which is best, let us plot both the equations we estimated
against the regression model we made earlier. Note that the regression
model was showing a 95% prediction interval (in red), which depends on
the SD that we formulated (in green and purple), but it is not expected
to be equal to it.

```R
plot(df1$amplitude, df1$duration,
     main='df1', pch='.')

## regression fit:
lines(exp(new$log_amplitude), exp(y_values[,1]), lwd=2, col='red')
lines(exp(new$log_amplitude), exp(y_values[,2]), lwd=2, col='red')
lines(exp(new$log_amplitude), exp(y_values[,3]), lwd=2, col='red')

## our equations:
lines(cart_x, cart_y, lwd=2, col='green', lty=2)

## linear sd
sd_y = 0.55 + 3.54 * cart_x
lines(cart_x, cart_y+sd_y, lwd=2, col='green', lty=2)
lines(cart_x, cart_y-sd_y, lwd=2, col='green', lty=2)

## assymtotic sd:
sd_y = (sd_ea + sd_eb) - sd_ea*exp(-cart_x)
lines(cart_x, cart_y+sd_y, lwd=2, col='purple', lty=2)
lines(cart_x, cart_y-sd_y, lwd=2, col='purple', lty=2)
legend('bottomright', legend=c('regresssion', 'linear SD equation', 'assymptotic SD equation'),lty=1, col=c('red', 'green', 'purple'))
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-9-1.png)

It seems that the assymptotic equation of SD do a better job than the
linear equation. Furthermore, it is a wished property that the SD does
not diverge. 

Thus, to summarize, our full model of the duration of
saccade according to duration should follows: 

<!-- remember that:
cart_y = (cart_x^a) * exp(b)
sd_y = (sd_ea + sd_eb) - sd_ea*exp(-cart_x)
-->

$$
\text{E}(Duration) \approx Amplitude^{0.51} \times \exp(3.05) \\
$$
$$
\text{SD}(Duration) \approx 5.53 - 3.56 \exp(-Amplitude) \\
$$

with $E()$ the estimation of the mean and $SD()$ the estimation fo the standard deviation.
<!-- SD(Duration) = 0.55 + 3.54.Amp
    E(Duration) = Amp^0.51 * exp(3.05)
-->
### Implement a Stochastic Generator

Let us try to generate data from these equations .

``` R
getADuration <- function(amp, n){
  mean.Duration = (amp^a) * exp(b)
  SD.Duration = (sd_ea + sd_eb) - sd_ea * exp(-amp)
  return(rnorm(length(mean.Duration)*n, mean.Duration, SD.Duration))
}

amp_space <- runif(5000, min=min(df1$amplitude), max=1)
gen.duration <- getADuration(amp_space, 1)

red_col = rgb(200,100,100,50,maxColorValue=255)
plot(df1$amplitude, df1$duration, ylim= c(4, 30), xlim=c(0, 1.2))
points(amp_space, gen.duration, ylim = c(4, 30), xlim=c(0, 1.2), col=red_col)
legend("bottomright", c('extracted data', 'model'), col=c('black', red_col), pch=1)
```

![](/Blog/img/research/analyseExtractedData_files/figure-markdown/unnamed-chunk-10-1.png)

The data we generated with the stochastic model (red dots) look pretty close to the real data we extracted from Troncoso et al. 2008.

We've got a pretty cool stochastic generator of saccade durations from a poor quality jpeg! With this generator, we can
predict saccade durations for amplitudes that Troncoso et al.
did not mesure.

Hope this post was helpful, and see you soon!
