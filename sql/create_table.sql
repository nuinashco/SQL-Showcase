-- Create table structure
CREATE TABLE user_events (
  user_id INT,
  event_time TIMESTAMP,
  event_type STRING
);

-- Insert data into the table
INSERT INTO user_events (user_id, event_time, event_type) VALUES
(1, '2024-10-01 10:00:00', 'login'),
(1, '2024-10-01 10:05:00', 'purchase'),
(1, '2024-10-01 10:20:00', 'purchase'),
(1, '2024-10-01 10:50:00', 'purchase'),
(1, '2024-10-01 11:05:00', 'logout'),
(2, '2024-10-02 09:00:00', 'login'),
(2, '2024-10-02 09:25:00', 'purchase'),
(2, '2024-10-02 09:50:00', 'logout'),
(2, '2024-10-02 10:30:00', 'login'),
(2, '2024-10-02 11:00:00', 'logout'),
(3, '2024-10-03 14:00:00', 'login'),
(3, '2024-10-03 14:05:00', 'purchase'),
(3, '2024-10-03 14:10:00', 'purchase'),
(3, '2024-10-03 14:20:00', 'purchase'),
(3, '2024-10-03 14:50:00', 'logout'),
(3, '2024-10-03 15:30:00', 'login');