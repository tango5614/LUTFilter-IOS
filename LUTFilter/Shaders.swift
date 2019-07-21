//
//  Shaders.swift
//  LUTFilter
//
//  Created by 王文杰 on 2019/7/21.
//  Copyright © 2019 wangwenjie. All rights reserved.
//

import Foundation
class Shaders {
  static let vertex =
  """
  attribute vec4 position;
  attribute vec2 a_texCoordIn;
  varying vec2 v_TexCoordOut;

  void main(void) {
      v_TexCoordOut = a_texCoordIn;
      gl_Position = position;
  }
  """
  static let fragement =
  """
  precision mediump float;

  varying vec2 v_TexCoordOut;
  uniform sampler2D inputImageTexture;
  uniform sampler2D inputImageTexture2; // lookup texture
  uniform float volume;

  void main()
  {
      vec4 textureColor = texture2D(inputImageTexture, v_TexCoordOut);
      
      float blueColor = textureColor.b * 63.0;
      
      vec2 quad1;
      quad1.y = floor(floor(blueColor) / 8.0);
      quad1.x = floor(blueColor) - (quad1.y * 8.0);
      
      vec2 quad2;
      quad2.y = floor(ceil(blueColor) / 8.0);
      quad2.x = ceil(blueColor) - (quad2.y * 8.0);
      
      vec2 texPos1;
      texPos1.x = (quad1.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
      texPos1.y = (quad1.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);
      
      vec2 texPos2;
      texPos2.x = (quad2.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
      texPos2.y = (quad2.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);
      
      vec4 newColor1 = texture2D(inputImageTexture2, texPos1);
      vec4 newColor2 = texture2D(inputImageTexture2, texPos2);
      
      vec4 newColor = mix(newColor1, newColor2, fract(blueColor));
      gl_FragColor = mix(textureColor, vec4(newColor.rgb, textureColor.w), volume);
  }
  """
}
