import openpyxl
import csv
from datetime import datetime

def process_flight_data():
    # 使用openpyxl读取Excel文件
    wb = openpyxl.load_workbook('Homework_02_Data.xlsx')
    sheet = wb.active
    
    # 存储城市信息的字典
    city_info = {}
    
    # 获取列标题
    headers = [cell.value for cell in sheet[1]]
    print("Excel文件中的列标题：", headers)
    
    origin_city_col = None
    time_col = None
    
    # 找到需要的列
    for i, header in enumerate(headers, 1):
        if header == '出发城市':  # 出发城市列
            origin_city_col = i
        elif header == '到达时间':  # 到达时间列
            time_col = i
    
    if not (origin_city_col and time_col):
        print("错误：未找到所需的列名")
        return
    
    # 处理数据行
    for row in list(sheet.rows)[1:]:  # 跳过表头
        city = row[origin_city_col-1].value  # 出发城市
        time_value = row[time_col-1].value   # 到达时间
        
        if city and time_value:
            if city not in city_info:
                city_info[city] = {
                    'count': 0,
                    'earliest': None,
                    'latest': None
                }
            
            # 更新航班数量
            city_info[city]['count'] += 1
            
            try:
                # 如果time_value已经是datetime对象
                if isinstance(time_value, datetime):
                    current_time = time_value.time()
                    time_str = time_value.strftime('%H:%M')
                else:
                    # 如果是字符串，尝试解析
                    time_str = time_value.split()[1] if ' ' in time_value else time_value
                    current_time = datetime.strptime(time_str, '%H:%M').time()
                
                # 更新最早时间
                if city_info[city]['earliest'] is None:
                    city_info[city]['earliest'] = time_str
                else:
                    earliest_time = datetime.strptime(city_info[city]['earliest'], '%H:%M').time()
                    if current_time < earliest_time:
                        city_info[city]['earliest'] = time_str
                
                # 更新最晚时间
                if city_info[city]['latest'] is None:
                    city_info[city]['latest'] = time_str
                else:
                    latest_time = datetime.strptime(city_info[city]['latest'], '%H:%M').time()
                    if current_time > latest_time:
                        city_info[city]['latest'] = time_str
                        
            except (ValueError, AttributeError) as e:
                print(f"警告：无法解析时间 {time_value} (来自 {city}): {str(e)}")
    
    # 使用csv模块写入数据到origins.csv
    with open('origins.csv', 'w', newline='', encoding='utf-8-sig') as csvfile:
        writer = csv.writer(csvfile)
        # 写入表头
        writer.writerow(['城市', '航班数量', '最早到达', '最晚到达'])
        # 写入数据
        for city, info in city_info.items():
            writer.writerow([
                city,
                info['count'],
                info['earliest'] or 'N/A',
                info['latest'] or 'N/A'
            ])
    
    # 获取并输出前十城市
    # 将城市信息转换为列表并按航班数量排序
    city_list = [(city, info['count']) for city, info in city_info.items()]
    city_list.sort(key=lambda x: (-x[1], x[0]))  # 按航班数量降序，城市名升序
    
    print("\n到达南京航班数前十城市：")
    for i, (city, count) in enumerate(city_list[:10], 1):
        print(f"{city}: {count}航班")

if __name__ == "__main__":
    process_flight_data() 