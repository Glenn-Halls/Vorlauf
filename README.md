<h1>Numeral Legacy</h1>

<br>

<h2>Introduction</h2>
My first app developed for Wear OS, this watch face can be installed on any large round device running Wear OS 4, such as the Samsung Galaxy Watch 6 Classic (pictured). Developed using Samsung and Google’s Watch Face Format – a declarative XML format containing no executable code thus requiring less maintenance and benefitting from future improvements to performance and battery optimisation.
<br>
<br>

![Screenshots of app in use](description.png?raw=true "Screenshots")


<h2>About the watch face</h2>
The watch face consists of 4 central complications and 4 peripheral app shortcuts, which can be enabled or disabled / hidden. The watch face can be edited either directly on the watch or via your mobile companion app such as Galaxy Wear.
<br>
<br>
<ul>
  <li>Top Complication: Digital Display</li>
  <ul>
    <li>10 options are available for the digital display. The time options can be pressed to access the alarm, the date to access the calendar, and the heart rate to access the default heart-rate-monitor app. The user can select from:</li>
      <ul>
        <li>Hidden</li>
        <li>12-hour time</li>
        <li>12-hour time with AM / PM</li>
        <li>Military time (HHMM)</li>
        <li>24-hour time (HH:MM)</li>
        <li>Step count</li>
        <li>Heart Rate</li>
        <li>Notification count (hidden if 0)</li>
        <li>Date (day of week, day of month)</li>
        <li>Weather</li>
      </ul>
  </ul>
  <li>Left Complication: Battery</li> 
  <ul>
    <li>Analog hand and % indicates battery</li>
    <li>Progress arc represents user-specified “ranged value” from 1-10</li>
    <li>Examples: battery, step goal, moon phase, UV index, precipitation, sunrise / sunset</li>
  </ul>
  <li>Right Complication: Short Text</li>
  <ul>
    <li>Displays a 7-character string of the user’s choice, can display information from a wide range of inbuilt and additional complications</li>
    <li>Examples: barometer, heart rate, steps, water intake, weather, sunrise/sunset, next alarm, world clock, WhatsApp, date</li>
  </ul>
  <li>Bottom Complication: Step Count</li>
  <ul>
  <li>Analog representation of daily step count where:</li>
  <ul>
    <li>Hand = steps x 100</li>
    <li>Grey Arc = steps x 1,000 (hidden below 1,000)</li>
    <li>White Highlight = steps x 10,000 (hidden below 10,000)</li>
  </ul>
  <li>User can select app to launch on tap such as: recent apps, media controller, assistant, alarm, stopwatch, timer, Spotify, WhatsApp, voice recorder</li>
  </ul>
  <li>Numerals II, IV, VIII and X</li>
  <ul>
  <li>These icons function as user-defined app shortcuts. The first time the icon is pressed the user will be prompted to choose an app for the shortcut. This can be changed or set to “empty” to be disabled.</li>
  </ul>
</ul>

<br>
<br>

<h2>How to install watch face, step-by-step</h2>
<ol>
<li>Install Android Studio</li>
<li>Project: Get from VCS</li>
<li>URL: https://github.com/Glenn-Halls/Vorlauf.git</li>
<li>Clone</li>
<li>Add configuration:</li>
  <ol><li>Add new</li>
  <li>Android App:</li>
    <ol>
      <li>Module: Vorlauf.app.main</li>
      <li>Deploy: Default APK</li>
      <li>Launch: Nothing</li>
    </ol>
  </ol>
<li>Build --> Make project</li>
<li>Enable wireless debugging on watch</li>
  <ol>
    <li>Enable developer mode (this is watch-specific)</li>
    <li>Settings  developer options, enable ADB debugging</li>
    <li>Wireless debugging options</li>
    <li>Enable wireless debugging</li>
  </ol>
<li>Pair watch with Android Studio</li>
  <ol>
    <li>Pair new device on watch (under wireless debugging)</li>
    <li>Device manager  Pair devices using Wi-Fi in Android Studio</li>
    <ol>
      <li>Pair using pairing code</li>
    </ol>
  </ol>
<li>Once successfully paired, with your watch selected as the target device, click “Run”</li>
<li>The watch face will be installed on your watch but will not be set as the default watch face. You will need to add the face as you would any other face. It will be under the heading “Downloaded”.</li>
</ol>
