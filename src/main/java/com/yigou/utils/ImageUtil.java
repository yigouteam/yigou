package com.yigou.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImageUtil {
	public static final char[] chars={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
	public static final int size=4;
	public static final int width=80;
	public static final int height=40;
	public static final int font_size=20;
	public static Map<String,BufferedImage> createImage(){
		StringBuffer sb = new StringBuffer();
		BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		g.setColor(Color.LIGHT_GRAY);
		g.fillRect(0, 0, width, height);
		Random ran = new Random();
		for(int i=1;i<=size;i++){
			Color c = new Color(ran.nextInt(256),ran.nextInt(256),ran.nextInt(256));
			g.setColor(c);
			g.setFont(new Font(null,Font.BOLD+Font.ITALIC,font_size));
			int r=ran.nextInt(chars.length);
		    g.drawString(chars[r]+"", (i-1)*width/size, height/2);
		    g.drawLine(ran.nextInt(width), ran.nextInt(height), ran.nextInt(width), ran.nextInt(height));
		    g.setColor(Color.red);
		    g.drawString(".", (i-1)*width/size, height/2);
		    sb.append(chars[r]);
		}
		Map<String,BufferedImage> map = new HashMap<String,BufferedImage>();
		map.put(sb.toString(), image);
		return map;
	}
}
