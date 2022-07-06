package com.mti.hybrid_composition_ex

import android.content.Context
import android.text.InputType
import android.util.AttributeSet
import androidx.annotation.Keep

/** * Created by tareq on 03,May,2022. */
@Keep
class SecureCardPinEditText : SecureEditText {

  constructor(context: Context) : super(context) {}

  constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {}

  constructor(
    context: Context,
    attrs: AttributeSet?,
    defStyleAttr: Int
  ) : super(context, attrs, defStyleAttr) {}

  override fun initialize(context: Context, attrs: AttributeSet?) {
    super.initialize(context, attrs)
    setMaxLength(4)
    super.setInputType(InputType.TYPE_CLASS_NUMBER or InputType.TYPE_NUMBER_VARIATION_PASSWORD)
  }


}
