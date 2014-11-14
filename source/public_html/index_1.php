<?php
require_once '../lib/config.php';

\data\layout::BuildPage();
?>
<!DOCTYPE html>
<html>
    <head>
        <title>The FABB Herd</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/css/main.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="/js/functions.js"></script>
    </head>
    <body>
        <div id="header" class="fixed">
            <div class="container">
                <a href="#home">Home</a>
                <a href="#about">About</a>
                <a href="#news">News</a>
                <a href="#cattle">Cattle</a>
                <a href="#contact">Contact</a>
                <a href="#events">Events</a>
                <div id="small-logo"><img src="/img/small-logo.png" alt="The Fabb Herd" width="100%" /></div>
            </div>
        </div>
        <div id="home-content" class="container">
            <h1>Introductory <em>marketing</em> text to go here, with <em>emphasised</em> words and <em>phrases</em></h1>
            <div id="large-logo"><img src="/img/full-logo.png" alt="The Fabb Herd" width="100%" /></div>
            <h3>Use the links above or keep scrolling down to view more</h3>
        </div>
        <div id="about-content" class="container">
            <div class="breaker" id="about-breaker">
                <h1>About</h1>
            </div>
            <div class="content">
                <div class="left-col">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed quam mauris. Aliquam venenatis pulvinar mauris et ornare. Nunc nec venenatis lectus, quis tincidunt augue. Nunc dui enim, pulvinar non consectetur vitae, malesuada vel enim. Proin interdum, lectus a suscipit dapibus, libero lectus tempus neque, posuere viverra eros lorem nec lorem. Vivamus quis laoreet urna. Donec vulputate ligula sed nibh dignissim malesuada. Donec ornare nibh ligula. Sed ullamcorper leo libero, quis ultricies sapien bibendum ornare. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque ornare at nisl a varius.</p>
                    <p>Aliquam in egestas sapien. Quisque convallis suscipit orci, at ornare nisi aliquam in. Ut nec quam iaculis, volutpat orci quis, pharetra urna. Donec ultrices massa quis enim mattis aliquet. Suspendisse ante neque, rutrum ac augue at, pretium rutrum odio. Aenean ac urna nulla. Vestibulum convallis sit amet arcu vel bibendum. Quisque bibendum, dui non feugiat vestibulum, lorem orci pharetra nunc, in faucibus elit nunc quis massa. Duis vel pellentesque orci. Donec augue risus, fringilla quis ultricies ac, venenatis sed lectus. Sed at pellentesque dui, bibendum molestie ipsum. Nulla ac leo ante.</p>
                </div>
                <div class="right-col"></div>
            </div>
        </div>
        <div id="news-content" class="container">
            <div class="breaker" id="news-breaker">
                <h1>News</h1>
            </div>
            <div class="content">
                <div class="left-col even-col">
                    <ul class="news-holder">
                        <li>
                            <h4>Something cool happened today</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed quam mauris. Aliquam venenatis pulvinar mauris et ornare. Nunc nec venenatis lectus.</p>
                        </li>
                        <li>
                            <h4>Something cool happened today</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed quam mauris. Aliquam venenatis pulvinar mauris et ornare. Nunc nec venenatis lectus.</p>
                        </li>
                        <li>
                            <h4>Something cool happened today</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed quam mauris. Aliquam venenatis pulvinar mauris et ornare. Nunc nec venenatis lectus.</p>
                        </li>
                    </ul>
                </div>
                <div class="right-col even-col">
                    <ul class="news-holder">
                        <li>
                            <h4>Something cool happened today</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed quam mauris. Aliquam venenatis pulvinar mauris et ornare. Nunc nec venenatis lectus.</p>
                        </li>
                        <li>
                            <h4>Something cool happened today</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed quam mauris. Aliquam venenatis pulvinar mauris et ornare. Nunc nec venenatis lectus.</p>
                        </li>
                        <li>
                            <h4>Something cool happened today</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed quam mauris. Aliquam venenatis pulvinar mauris et ornare. Nunc nec venenatis lectus.</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="cattle-content" class="container">
            <div class="breaker" id="cattle-breaker">
                <h1>Cattle</h1>
            </div>
            <div class="content">
                <ul id="cattle-list">
                    <li>
                        <span class="holder"><img src="/img/cattle/default.png" class="default" alt="Hero" /></span>
                        <span class="text">Hero</span>
                    </li>
                    <li>
                        <span class="holder"><img src="/img/cattle/default.png" class="default" alt="Bill" /></span>
                        <span class="text">Bill</span>
                    </li>
                    <li>
                        <span class="holder"><img src="/img/cattle/default.png" class="default" alt="Fernando" /></span>
                        <span class="text">Fernando</span>
                    </li>
                    <li>
                        <span class="holder"><img src="/img/cattle/daisy.png" alt="Daisy" /></span>
                        <span class="text">Daisy</span>
                    </li>
                </ul>
                <div class="cattle-details">
                    <h2 id="cattle-name"></h2>
                    <div id="cattle-figures">
                        <div class="cattle-figure"><span>4</span></div>
                        <div class="cattle-figure"><span>steer</span></div>
                        <div class="cattle-figure"><span>44"</span></div>
                    </div>
                    <div id="cattle-description">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mattis massa eu ante bibendum, et imperdiet eros lobortis. Duis eu suscipit nulla, id malesuada metus. Quisque varius turpis vel tortor mattis, id pretium nibh viverra. Fusce eu porttitor odio. Nam facilisis, risus in sollicitudin sodales, neque augue fringilla mauris, eget lobortis sapien lectus et sapien. Fusce feugiat nec leo in fermentum. Sed et risus vel quam fringilla euismod.</p>
                    </div>
                </div>
                <div id="cattle-images">
                    <div id="image-view"></div>
                    <ul id="image-thumbs">
                        <li><img src="/img/cattle/gallery/daisy-1.jpg" alt="Daisy" /></li>
                        <li><img src="/img/cattle/gallery/daisy-1.jpg" alt="Daisy" /></li>
                        <li><img src="/img/cattle/gallery/daisy-1.jpg" alt="Daisy" /></li>
                        <li><img src="/img/cattle/gallery/daisy-1.jpg" alt="Daisy" /></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="contact-content" class="container">
            <div class="breaker" id="contact-breaker">
                <h1>Contact</h1>
            </div>
            <div class="content">
                <form action="/contact.php" method="post" id="contact-form">
                    <h3>Please fill in the form below to send us a message and we will reply to you as soon as possible where appropriate.</h3>
                    <input type="text" name="name" placeholder="Name" data-required="true" /><br />
                    <input type="text" name="email" placeholder="Email address" data-required="true" /><br />
                    <input type="text" name="phone" placeholder="Phone number" data-required="false" /><br />
                    <textarea name="message" placeholder="Message" data-required="true"></textarea><br />
                    <input type="hidden" name="submitted" value="TRUE" />
                    <input type="submit" name="send" value="Send Message" />
                </form>
            </div>
        </div>
        <div id="events-content" class="container">
            <div class="breaker" id="events-breaker">
                <h1>Events</h1>
            </div>
            <div class="content">
                <div class="left-col">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed quam mauris. Aliquam venenatis pulvinar mauris et ornare. Nunc nec venenatis lectus, quis tincidunt augue. Nunc dui enim, pulvinar non consectetur vitae, malesuada vel enim. Proin interdum, lectus a suscipit dapibus, libero lectus tempus neque, posuere viverra eros lorem nec lorem. Vivamus quis laoreet urna. Donec vulputate ligula sed nibh dignissim malesuada. Donec ornare nibh ligula. Sed ullamcorper leo libero, quis ultricies sapien bibendum ornare. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque ornare at nisl a varius.</p>
                    <p>Aliquam in egestas sapien. Quisque convallis suscipit orci, at ornare nisi aliquam in. Ut nec quam iaculis, volutpat orci quis, pharetra urna. Donec ultrices massa quis enim mattis aliquet. Suspendisse ante neque, rutrum ac augue at, pretium rutrum odio. Aenean ac urna nulla. Vestibulum convallis sit amet arcu vel bibendum. Quisque bibendum, dui non feugiat vestibulum, lorem orci pharetra nunc, in faucibus elit nunc quis massa. Duis vel pellentesque orci. Donec augue risus, fringilla quis ultricies ac, venenatis sed lectus. Sed at pellentesque dui, bibendum molestie ipsum. Nulla ac leo ante.</p>
                </div>
                <div class="right-col"></div>
            </div>
        </div>
    </body>
</html>
