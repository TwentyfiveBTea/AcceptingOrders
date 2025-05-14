import time

import requests
import pymysql
from bs4 import BeautifulSoup

def get_list_page_url(city):

    start_url = "https://{}.lianjia.com/ershoufang".format(city)
    headers =  {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',
    }



    try:
        response = requests.get(start_url, headers=headers)
        if response.status_code != 200:
            print(f"请求失败，状态码: {response.status_code}")
            return []
        #print(response.status_code, response.text)
        return response.text
    except:
        print("获取总套数出错,请确认起始URL是否正确")
        return None

def dataStandard(text):
    soup = BeautifulSoup(text, 'html.parser')

    # 查找所有房源列表项
    house_list = soup.find_all('li', class_='clear LOGVIEWDATA LOGCLICKDATA')
    # print(len(house_list))
    # for house in house_list:
    #     print(house)
    houses = []
    for house in house_list:
        # 提取标题
        title = house.find('div', class_='title').a.text.strip()

        # 提取区域信息
        position_info = house.find('div', class_='positionInfo')
        region = position_info.a.text.strip() if position_info.a else ''

        # 提取户型、面积、朝向、装修、楼层信息
        house_info = house.find('div', class_='houseInfo').text.strip().split('|')
        layout = house_info[0].strip() if len(house_info) > 0 else ''
        area = house_info[1].strip() if len(house_info) > 1 else ''
        direction = house_info[2].strip() if len(house_info) > 2 else ''
        decoration = house_info[3].strip() if len(house_info) > 3 else ''
        floor = house_info[4].strip() if len(house_info) > 4 else ''

        # 提取总价和单价
        total_price = house.find('div', class_='totalPrice').text.strip()
        unit_price = house.find('div', class_='unitPrice').text.strip()

        # 提取关注人数和发布时间
        follow_info = house.find('div', class_='followInfo').text.strip()

        # 提取标签
        tags = [tag.text.strip() for tag in house.find_all('span', class_=True)]

        # 提取链接
        link = house.find('a', class_='noresultRecommend img LOGCLICKDATA')['href']

        # 将信息存入字典
        house_data = {
            'title': title,
            'region': region,
            'layout': layout,
            'area': area,
            'direction': direction,
            'decoration': decoration,
            'floor': floor,
            'total_price': total_price,
            'unit_price': unit_price,
            'follow_info': follow_info,
            'tags': tags,
            'link': link
        }
        houses.append(house_data)

    # 打印提取的房源信息
    # for house in houses:
    #     print(house)
    #     print(len(houses))
    db_config = {
        'host': 'localhost',
        'user': 'root',
        'password': 'ymq20050704',
        'database': 'house_crawler',
        'charset': 'utf8mb4'
    }

    # 连接数据库
    conn = pymysql.connect(**db_config)
    cursor = conn.cursor()

    # 创建表（如果不存在）
    create_table_sql = '''
    CREATE TABLE IF NOT EXISTS houses_lianjia (
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        region VARCHAR(50),
        layout VARCHAR(20),
        area VARCHAR(20),
        direction VARCHAR(20),
        decoration VARCHAR(20),
        floor VARCHAR(50),
        total_price VARCHAR(20),
        unit_price VARCHAR(20),
        follow_info VARCHAR(50),
        tags TEXT,  # 存储为逗号分隔的字符串
        link VARCHAR(255) UNIQUE,  # 确保链接唯一
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
    '''
    cursor.execute(create_table_sql)
    for house_data in houses:
        # 处理tags列表，转换为逗号分隔的字符串
        tags_str = ','.join(house_data['tags'])

        # 插入数据
        try:
            insert_sql = '''
            INSERT INTO houses_lianjia (
                title, region, layout, area, direction, decoration, 
                floor, total_price, unit_price, follow_info, tags, link
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            '''
            cursor.execute(insert_sql, (
                house_data['title'],
                house_data['region'],
                house_data['layout'],
                house_data['area'],
                house_data['direction'],
                house_data['decoration'],
                house_data['floor'],
                house_data['total_price'],
                house_data['unit_price'],
                house_data['follow_info'],
                tags_str,
                house_data['link']
            ))

            conn.commit()
            print("数据插入成功！")
        except pymysql.IntegrityError:
            print("该链接已存在，跳过插入")
    conn.close()
def main():
    # house_list = get_list_page_url('nj')
    # print(house_list)
    # with open("Output_lianjia.txt", 'w') as file:
    #     file.write(house_list)

    with open('Output_lianjia.txt', 'r', encoding='utf-8') as file:
        html_content = file.read()
    dataStandard(html_content)

if __name__ == '__main__':
    old = time.time()
    main()
    new  = time.time()
    delta_time = new - old
    print("程序共运行{}s".format(delta_time))