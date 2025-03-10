/*
 * MessageRecomposer.cpp
 *
 *  Created on: Feb 18, 2024
 *      Author: arusso
 */

#include "MessageRecomposer.h"

#include "stdio.h"


MessageRecomposer::MessageRecomposer() {
	// TODO Auto-generated constructor stub

}

void MessageRecomposer::add_frame(uint8_t *frame_data, uint8_t length) {

	int msg_number;
    int msg_size;
    int frame_index;

    decode_descriptor(frame_data, msg_number, msg_size, frame_index);

    // TODO check if the number follows the expected order (0 -> 1 -> 2 -> 3 -> 0 -> ...)
    // But it's not that easy bc what if we miss an entire message ? we would loose the 3 messages that follow it
    if(msg_number_ != msg_number) {
        // new message
        // printf("New message\n");
        msg_number_ = msg_number;
        n_frames_ = msg_size;
        for(int i=0; i<n_frames_; i++) {
            frames_received_[i] = false;
        }
    }

    frames_received_[frame_index] = true;
    msg_parts[frame_index] = std::string((char*)frame_data+2, length-2);

    for(int i=0; i<n_frames_; i++) {
    	// printf("Frame %d received : %d\n", i, frames_received_[i]);
    }

    if(all_frames_received()) {
        printf("All frames received\n");
        std::string full_msg;
        for(int i=0; i<n_frames_; i++) {
            full_msg += msg_parts[i];
        }
        full_msg_ = full_msg;
        full_msg_received_ = true;
        for(int i=0; i<n_frames_; i++) {
            frames_received_[i] = false;
        }
    }
}

bool MessageRecomposer::check_if_new_full_msg() {
    return full_msg_received_;
}

std::string MessageRecomposer::get_full_msg() {
    full_msg_received_ = false;
    return full_msg_;
}

MessageRecomposer::~MessageRecomposer() {
	// TODO Auto-generated destructor stub
}

void MessageRecomposer::decode_descriptor(uint8_t *frame_data, int &msg_number,
		int &msg_size, int &frame_index) {

    uint16_t msg_descriptor = frame_data[1] << 8 | frame_data[0];

    // todo mask the unused bits for safety (eg if error of transmission)

    msg_number = (msg_descriptor >> 12);
    msg_size = (msg_descriptor >> 6) & 0x3F;
    frame_index = msg_descriptor & 0x3F;
}

bool MessageRecomposer::all_frames_received() {
    for(int i=0; i<n_frames_; i++) {
        if(!frames_received_[i]) {
            return false;
        }
    }
    return true;
}
