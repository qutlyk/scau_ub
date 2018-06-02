package model;

import java.util.ArrayList;

public class Model {

	public static String[] projectlist1={"作物学","植物生理与生物化学","应用概率统计","遗传学","田间试验设计","农业生态学","作物栽培与耕作学","育种学","种子学","植物病虫害学"};
	public static String[] projectlist2={"计算机科学与技术","软件工程","网络工程","信息安全","物联网工程","数字媒体技术","智能科学与技术","空间信息与数字技术","电子与计算机工程"};
	public static String[] projectlist3={"物理学类","化学类","生物学类","天文类","地质类","地理类","地球物理类","大气科学","力学","电子信息","环境科学","统计学"};
	public static String[] projectlist4={"金融学","政治经济","经济学","经济管理学","经济学","资源经济","涉外经济管理","国民经济管理学","世界经济","世界经济学","国际经济"};
	public static String[] projectlist5={"广告学","新闻学","传播学","数字出版 ","编辑出版学 ","广播电视学"," 网络与新媒体秘书学 ","汉语言"," 古典文献学 ","汉语言文学 ","应用语言学 "};
	public static String[] projectlist6={"广告学","新闻学","传播学","数字出版 ","编辑出版学 ","广播电视学"," 网络与新媒体秘书学 ","汉语言"," 古典文献学 ","汉语言文学 ","应用语言学 "};
	public static String[] projectlist7={"广告学","新闻学","传播学","数字出版 ","编辑出版学 ","广播电视学"," 网络与新媒体秘书学 ","汉语言"," 古典文献学 ","汉语言文学 ","应用语言学 "};
	public static String[] projectlist8={"广告学","新闻学","传播学","数字出版 ","编辑出版学 ","广播电视学"," 网络与新媒体秘书学 ","汉语言"," 古典文献学 ","汉语言文学 ","应用语言学 "};
	public static String[] projectlist9={"广告学","新闻学","传播学","数字出版 ","编辑出版学 ","广播电视学"," 网络与新媒体秘书学 ","汉语言"," 古典文献学 ","汉语言文学 ","应用语言学 "};

	public static ArrayList<String[]> projectlist=new ArrayList<String[]>(){{add(Model.projectlist1);add(Model.projectlist2);add(Model.projectlist3);add(Model.projectlist4);add(Model.projectlist5);add(Model.projectlist6);add(Model.projectlist7);add(Model.projectlist8);add(Model.projectlist9);}};

	public static ArrayList<String>  bookkindlist=new ArrayList<String>()
	{{add("农学类"); add("计算机类");add("理工类");add("经济类");add("人文类");add("哲学类");
		add("法学类");add("艺术类");add("数学类");}};

	/**
	 * the book is not sold out,everyone can buy and add it to shopcart
	 */
	public static int BookNotSold=0;
	/**
	 * the book is payed by buyer,but the buyer is not confirm Received
	 */
	public static int BookNotReceived=1;
	/**
	 * the book is payed by buyer,and the buyer is confirm Received.
	 */
	public static int BookSuccess=2;

}
