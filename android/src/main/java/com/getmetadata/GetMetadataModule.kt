package com.getmetadata

import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.os.Bundle
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class GetMetadataModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  fun getBundle(): Bundle {
    val context = super.getReactApplicationContext()
    val appInfo: ApplicationInfo = context.getPackageManager()
      .getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA)
    return appInfo.metaData
  }

  @ReactMethod
  fun forKey(key: String, promise: Promise) {
    try {
      val bundle: Bundle = getBundle()
      val value: String = bundle.getString(key) ?: throw Exception("Key not found: $key")
      promise.resolve(value)
    } catch (e: Throwable) {
      promise.reject("[ERROR:GetMetadata.forKey]", e)
    }
  }

  @ReactMethod
  fun intForKey(key: String, promise: Promise) {
    try {
      val bundle: Bundle = getBundle()
      val value: Int = bundle.getInt(key)
      promise.resolve(value)
    } catch (e: Throwable) {
      promise.reject("[ERROR:GetMetadata.intForKey]", e)
    }
  }

  companion object {
    const val NAME = "GetMetadata"
  }
}
