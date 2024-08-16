# Bytelogik_task

1)User Login Functionality: Users can login with their unique Username. This feature ensures that each user's session is tracked separately.
2)Increment Button with Persistent State: After logging in, users are presented with a page that includes an increment button and a display showing a numerical value. Each time the button is pressed, the value is incremented, and the display is updated accordingly.
3)Persistent Storage Using Shared Preferences: The user's increment value is stored locally using the shared_preferences package. This ensures that the value persists between sessions. When a user logs in again, they can see the value from their previous session. For instance, if User1 has clicked the button 5 times and User2 has clicked it 2 times, each will see their respective values upon login.
4)Flutter Framework: Used for building the cross-platform application, ensuring a seamless and responsive UI/UX.
5)Shared Preferences: Utilized for lightweight and fast data storage, allowing us to store user-specific values on the device.

In Terminal ----
 flutter build apk

In Android Studio----
 build ---> flutter ---> build apk

Path apk
  Local_Disk:\application_folder_name\build\app\outputs\flutter-apk
