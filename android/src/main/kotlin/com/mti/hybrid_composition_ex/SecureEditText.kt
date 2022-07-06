package com.mti.hybrid_composition_ex


import android.content.Context
import android.text.Editable
import android.text.InputFilter
import android.text.InputType
import android.text.TextWatcher
import android.util.AttributeSet
import android.util.Log
import android.util.TypedValue
import android.widget.EditText

import kotlin.random.Random

/** * Created by tareq on 09,April,2022. */
abstract class SecureEditText : EditText {

    var uiKey: String? = null
    var passwordType: Int = 0 // 0 means password

    /*
     * Initialize class with {@param context}, {@param attributeSet} and {@param EditTextModel} pass as an argument. Used while creating EditTextPicker programmatically
     * */

    constructor(context: Context) : super(context) {
        super.setInputType(InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_PASSWORD)
    }

    constructor(context: Context, defaultStyle: Int) : super(context, null, defaultStyle) {
        super.setInputType(InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_PASSWORD)
    }

    /*
     * Initialize class with {@param context}, and {@param attributeSet} pass as an argument
     * */
    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {
        initialize(context, attrs)
    }

    /*
     * Initialize class with {@param context}, {@param attributeSet} and {@param defaultStyle} pass as an argument
     * */
    constructor(
        context: Context,
        attrs: AttributeSet?,
        defaultStyle: Int
    ) : super(context, attrs, defaultStyle) {

        initialize(context, attrs)
    }

    private lateinit var _context: Context
    open fun initialize(context: Context, attrs: AttributeSet?) {
        _context = context
        val ta =
            context.obtainStyledAttributes(
                attrs,
                com.mti.hybrid_composition_ex.R.styleable.SecureEditText,
                0,
                0
            )
        try {
            val outValue = TypedValue()
            ta.getValue( com.mti.hybrid_composition_ex.R.styleable.SecureEditText_input_type, outValue)
            passwordType = outValue.data
            uiKey = ta.getString(R.styleable.SecureEditText_uiKey)
            if (uiKey == null) {
               // uiKey = SessionUtil(context).getUIKey()
            }

            when (passwordType) {
                0 -> {
                    super.setInputType(InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_PASSWORD)
                }
                1 -> {
                    super.setInputType(
                        InputType.TYPE_CLASS_NUMBER or InputType.TYPE_NUMBER_VARIATION_PASSWORD
                    )
                }
                2 -> {
                    setMaxLength(4)
                    super.setInputType(
                        InputType.TYPE_CLASS_NUMBER or InputType.TYPE_NUMBER_VARIATION_PASSWORD
                    )
                }
                else -> {
                    //  setMaxLength(0)
                    super.setInputType(
                        InputType.TYPE_CLASS_NUMBER or InputType.TYPE_NUMBER_VARIATION_PASSWORD
                    )
                }
            }
            /*mAnimatedType = outValue.data
            mMask = ta.getString(R.styleable.PinEntryEditText_pinCharacterMask)
            mSingleCharHint = ta.getString(R.styleable.PinEntryEditText_pinRepeatedHint)
            mLineStroke = ta.getDimension(R.styleable.PinEntryEditText_pinLineStroke, mLineStroke)
            mLineStrokeSelected = ta.getDimension(
                R.styleable.PinEntryEditText_pinLineStrokeSelected,
                mLineStrokeSelected
            )
            mSpace = ta.getDimension(R.styleable.PinEntryEditText_pinCharacterSpacing, mSpace)
            mTextBottomPadding = ta.getDimension(
                R.styleable.PinEntryEditText_pinTextBottomPadding,
                mTextBottomPadding
            )
            mIsDigitSquare =
                ta.getBoolean(R.styleable.PinEntryEditText_pinBackgroundIsSquare, mIsDigitSquare)
            mPinBackground = ta.getDrawable(R.styleable.PinEntryEditText_pinBackgroundDrawable)
            val colors = ta.getColorStateList(R.styleable.PinEntryEditText_pinLineColors)
            if (colors != null) {
                mColorStates = colors
            }*/
        } finally {
            ta.recycle()
        }
        /* mCharPaint = Paint(paint)
        mLastCharPaint = Paint(paint)
        mSingleCharPaint = Paint(paint)
        mLinesPaint = Paint(paint)
        mLinesPaint.setStrokeWidth(mLineStroke)
        val outValue = TypedValue()
        context.theme.resolveAttribute(
            R.attr.colorControlActivated,
            outValue, true
        )*/

    }

    fun setMaxLength(maxLength: Int) {
        val filters = arrayOf(InputFilter.LengthFilter(maxLength))
        super.setFilters(filters)
    }

    override fun addTextChangedListener(watcher: TextWatcher?) {

        super.addTextChangedListener(
            object : TextWatcher {
                override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {

                    watcher?.beforeTextChanged("", 0, 0, 0)
                }

                override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {

                    watcher?.onTextChanged("", 0, 0, 0)
                }

                override fun afterTextChanged(p0: Editable?) {
                    watcher?.afterTextChanged(Editable.Factory.getInstance().newEditable(""))
                }
            }
        )
    }



    /* override fun getText(): Editable? {
      val length = super.getText()?.length
      var temp = super.getText()
      if (length != null) {
        if (length > 0) {
          val sb = StringBuilder()
          for (i in 1..length) {
            sb.append("x")
          }

          temp = Editable.Factory.getInstance().newEditable(sb)
          Selection.setSelection(sb.toSpannable(), length)
        }
      }

      return temp
    }*/

    internal var txt = ""

    /*override fun getEditableText(): Editable {

      var temp = super.getEditableText()
      Log.d("Tareq", "getEditableText_>: ${temp.length} $temp")
      if (temp.length < txt.length) {
       txt = txt.dropLast(1)
      }
      txt += temp.trim().toString()

      val length = temp.length
      Log.d("Tareq", "getEditableText=>: ${txt.length} $txt")

      if (length != null) {
        if (length > 0) {
          val sb = StringBuilder()
          for (i in 1..length) {
            sb.append(" ")
          }

          temp = temp.replace(0, length, sb)
        }
      }
      return temp
    }*/



    override fun getEditableText(): Editable {

        var temp = super.getEditableText()
   //         Log.d("Tareq", "getEditableText_>: ${temp.length} $temp")

        if (temp.length < txt.length) {
            if (selectionStart == (txt.length - 1)) {
                txt = txt.dropLast(1)
            } else {
                txt = txt.removeRange(selectionStart, selectionEnd + 1)
            }
        }

        if (temp.isNotEmpty() && temp.length - txt.length > 1) { //for paste text
            if ((selectionEnd - selectionStart) == 0) {
                //    if (BuildConfig.DEBUG) Log.d("Tareq", "paste=>: ${temp} $txt selection $selectionStart")
                if (selectionStart == (txt.length - 1)) {

                    txt += temp.takeLast(temp.length - txt.length)
                } else {
                    //txt += temp.substring(selectionStart , selectionStart + (temp.length - txt.length))
                    txt += temp.takeLast(temp.length - txt.length)
                }
            }

        } else {
            //normal typing
            // if (BuildConfig.DEBUG) Log.d("Tareq", "type=>: ${temp} $txt selection $selectionStart $selectionEnd")
            if ((selectionEnd - selectionStart) == 0) {

                if (temp.isNotEmpty() && txt.length < temp.length) {


                    val substring = temp.substring(selectionStart - 1, selectionEnd)

                    txt = txt.insert(selectionStart - 1, substring)


                } else if (txt.length > temp.length) {
                    txt = temp.toString()
                }
            }
        }

        val length = temp.length
        //  if (BuildConfig.DEBUG) Log.d("Tareq", "getEditableText=>: ${txt.length} $txt")

        if (length != null) {
            if (length > 1) {
                val sb = StringBuilder()
                for (i in 1..length) {
                    if (temp.last().equals('0')) {
                        sb.append(Random.nextInt(1,9).toString())
                    } else {
                        sb.append(Random.nextInt(0,9).toString())
                    }
                }

                temp = temp.replace(0, length, sb)
            }
        }
        return temp
    }


    private fun String.insert(insertAt: Int, string: String): String {
        return this.substring(0, insertAt) + string + this.substring(insertAt, this.length)
    }

    //  internal fun getRText(): Editable? {
    //    return super.getEditableText()
    //  }

    //  override fun onSelectionChanged(selStart: Int, selEnd: Int) {
    //    // super.onSelectionChanged(selStart, selEnd)
    //    val text: CharSequence = txt.toString()
    //    if (text != null) {
    //      if (selStart != text.length || selEnd != text.length) {
    //        setSelection(text.length, text.length)
    //        return
    //      }
    //    }
    //    super.onSelectionChanged(selStart, selEnd)
    //  }


}
